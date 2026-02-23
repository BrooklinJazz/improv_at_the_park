defmodule ImprovAtTheParkWeb.HomeLive do
  use ImprovAtTheParkWeb, :live_view

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        page_title: "Improv at the Park - Welcome",
        contact_info: %{
          email: "brooklin@improvatthepark.com"
        }
      )

    if connected?(socket) do
      events = ImprovAtThePark.Events.get_events()
      {:ok, assign(socket, events: events)}
    else
      {:ok, assign(socket, events: [])}
    end
  end
end
