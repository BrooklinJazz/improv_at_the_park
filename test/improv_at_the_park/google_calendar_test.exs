defmodule ImprovAtThePark.GoogleCalendarTest do
  use ExUnit.Case
  doctest ImprovAtThePark.GoogleCalendar
  alias ImprovAtThePark.GoogleCalendar

  setup do
    # Clear the cache before each test to ensure we're testing the API call
    if File.exists?("./google_calendar_dump") do
      File.rm!("./google_calendar_dump")
    end

    :ok
  end

  @tag :external
  test "get_events returns a list of events" do
    events = GoogleCalendar.get_events()
    assert is_list(events)

    assert Enum.all?(events, fn event ->

             is_struct(event, GoogleCalendar.Event)
             %DateTime{} = event.start
             %DateTime{} = event.finish
           end)
  end
end
