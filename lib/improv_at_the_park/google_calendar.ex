defmodule ImprovAtThePark.GoogleCalendar do
  @google_calendar_dump "./google_calendar_dump"
  require Logger

  def get_events do
    # temporary caching mechanism to avoid hitting Google Calendar API rate limits during development
    if File.exists?(@google_calendar_dump) do
      Logger.info("Loading google calendar from cache...")
      File.read!(@google_calendar_dump) |> :erlang.binary_to_term()
    else
      Logger.warning("Loading google calendar from API...")

      %Req.Response{body: calendar} =
        Req.get!(
          "https://www.googleapis.com/calendar/v3/calendars/#{System.get_env("GOOGLE_CALENDAR_ID")}/events?key=#{System.get_env("GOOGLE_CALENDAR_API_KEY")}"
        )

      events =
        calendar["items"]
        |> Enum.map(fn event ->
          %__MODULE__.Event{
            id: event["id"],
            summary: event["summary"],
            description: event["description"],
            start: event["start"]["dateTime"],
            end: event["end"]["dateTime"]
          }
        end)

      File.write!(@google_calendar_dump, :erlang.term_to_binary(events))
      events
    end
  end
end
