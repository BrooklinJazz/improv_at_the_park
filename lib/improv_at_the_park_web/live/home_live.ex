defmodule ImprovAtTheParkWeb.HomeLive do
  use ImprovAtTheParkWeb, :live_view

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        page_title: "Improv at the Park - Welcome",
        contact_info: %{
          email: "brooklin@improvatthepark.com"
        },
        show_whatsapp_modal: false
      )

    if connected?(socket) do
      events = ImprovAtThePark.Events.get_events()
      {:ok, assign(socket, events: events)}
    else
      {:ok, assign(socket, events: [])}
    end
  end

  @impl Phoenix.LiveView
  def handle_event("open_whatsapp_modal", _params, socket) do
    {:noreply, assign(socket, show_whatsapp_modal: true)}
  end

  @impl Phoenix.LiveView
  def handle_event("close_whatsapp_modal", _params, socket) do
    {:noreply, assign(socket, show_whatsapp_modal: false)}
  end
end
