defmodule ImprovAtThePark.Calendar do
  @month_names [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ]

  def get_name(month_number) when is_integer(month_number) and month_number in 1..12 do
    Enum.at(@month_names, month_number - 1)
  end

  @doc """
  Returns a list of date structures for the current month including
  the extra buffer days at the beginning and end of the month to fill out the 35 space calendar grid.
  """
  def month(year, month) do
    first_of_month = Date.new!(year, month, 1)
    last_of_month = Date.end_of_month(first_of_month)

    # Calculate the number of buffer days needed at the start of the month
    start_buffer_days = first_of_month |> Date.day_of_week() |> rem(7)
    # Calculate the number of buffer days needed at the end of the month
    end_buffer_days = 6 - (last_of_month |> Date.day_of_week() |> rem(7))

    # Generate the list of dates for the calendar grid
    total_days = start_buffer_days + Date.days_in_month(first_of_month) + end_buffer_days

    # Create a list of date structures for the calendar grid
    Enum.map(0..(total_days - 1), fn i ->
      Date.add(first_of_month, i - start_buffer_days)
    end)
    # Group into weeks of 7 days
    |> Enum.chunk_every(7)
  end
end
