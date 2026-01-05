defmodule ImprovAtThePark.Events do
  alias ImprovAtThePark.Events.Event

  def get_events do
    eventbrite_key = Application.get_env(:improv_at_the_park, :eventbrite_key)
    eventbrite_org_id = Application.get_env(:improv_at_the_park, :eventbrite_org_id)

    %{body: %{"events" => events}} =
      Req.get!(
        "https://www.eventbriteapi.com/v3/organizations/#{eventbrite_org_id}/events?expand=venue",
        auth: {:bearer, eventbrite_key}
      )

    Enum.map(events, fn event ->
      %ImprovAtThePark.Events.Event{
        id: event["id"],
        name: event["name"]["text"],
        url: event["url"],
        description: event["description"]["text"],
        summary: event["summary"],
        start: from_iso8601!(event["start"]["utc"]),
        finish: from_iso8601!(event["end"]["utc"]),
        cover_image_url: event["logo"]["original"]["url"],
        address: event["venue"]["address"]["address_1"],
        published: event["published"] != nil,
        status: event["status"]
      }
    end)
    |> Enum.filter(&is_future_event?/1)
    |> Enum.filter(&is_published_event?/1)
  end

  def get_next_monday_date(today \\ Date.utc_today()) do
    monday = 1

    if Date.day_of_week(today) == monday do
      today
    else
      get_next_monday_date(Date.add(today, 1))
    end
  end

  def get_next_session_info do
    next_monday = get_next_monday_date()

    %{
      date: next_monday,
      formatted_date: Calendar.strftime(next_monday, "%B %d, %Y"),
      day_name: Calendar.strftime(next_monday, "%A"),
      time_start: "6:00 PM",
      time_end: "8:00 PM",
      time_range: "6:00 PM - 8:00 PM",
      location: "La Fontaine Park",
      address: "3400 Av. Émile-Duployé, Montréal, QC H2L 2T6",
      is_this_week: Date.diff(next_monday, Date.utc_today()) <= 7,
      days_until: Date.diff(next_monday, Date.utc_today())
    }
  end

  def format_days_until(days) do
    case days do
      0 -> "Today"
      1 -> "Tomorrow"
      days when days < 7 -> "#{days} days"
      days when days < 14 -> "Next week"
      _ -> "Coming soon"
    end
  end

  defp from_iso8601!(datetime_string) do
    {:ok, datetime, _offset} = DateTime.from_iso8601(datetime_string)
    datetime
  end

  defp is_future_event?(%Event{finish: finish}) do
    DateTime.compare(DateTime.utc_now(), finish) == :lt
  end

  defp is_published_event?(%Event{id: id, published: published, status: status}),
    do: published and status != "draft"
end
