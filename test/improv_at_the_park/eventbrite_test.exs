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

    for event <- events do
      assert %Event{} = event
      assert is_binary(event.cover_image_url)
      assert is_binary(event.description)
      assert is_binary(event.id)
      assert is_binary(event.name)
      assert is_binary(event.summary)
      assert is_binary(event.url)
      assert is_map(event.venue)
      assert %DateTime{} = event.start
      assert %DateTime{} = event.finish
      assert DateTime.compare(DateTime.utc_now(), event.finish) == :lt
    end
  end
end
