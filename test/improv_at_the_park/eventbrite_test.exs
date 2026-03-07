defmodule ImprovAtThePark.EventbriteTest do
  use ExUnit.Case
  doctest ImprovAtThePark.Eventbrite
  alias ImprovAtThePark.Eventbrite
  alias ImprovAtThePark.Eventbrite.Event

  setup do
    # Clear the cache before each test to ensure we're testing the API call
    if File.exists?("./eventbrite_dump") do
      File.rm!("./eventbrite_dump")
    end

    :ok
  end

  @tag :external
  test "get_events" do
    events = Eventbrite.get_events()
    assert is_list(events)
    assert Enum.all?(events, fn event -> is_struct(event, Event) end)
  end
end
