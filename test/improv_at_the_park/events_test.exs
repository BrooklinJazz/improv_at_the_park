defmodule ImprovAtThePark.EventsTest do
  use ExUnit.Case
  doctest ImprovAtThePark.Events
  alias ImprovAtThePark.Events
  alias ImprovAtThePark.Events.Event

  @tag :external
  test "get_events" do
    events = Events.get_events()
    assert is_list(events)

    for event <- events do
      assert %Event{} = event
      assert is_binary(event.cover_image_url)
      assert is_binary(event.description)
      assert is_binary(event.id)
      assert is_binary(event.name)
      assert is_binary(event.summary)
      assert is_binary(event.url)
      assert is_binary(event.address)
      assert %DateTime{} = event.start
      assert %DateTime{} = event.finish
      assert DateTime.compare(DateTime.utc_now(), event.finish) == :lt
    end
  end
end
