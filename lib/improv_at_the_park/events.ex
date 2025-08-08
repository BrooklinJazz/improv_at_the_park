defmodule ImprovAtThePark.Events do
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
end
