defmodule ImprovAtTheParkWeb.HomeLive do
  use ImprovAtTheParkWeb, :live_view

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        displayed_month: Date.utc_today().month,
        displayed_year: Date.utc_today().year,
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

  # TODO HANDLE YEAR CHANGE
  def handle_event("previous_month", _params, socket) do
    if socket.assigns.displayed_month == 1 do
      socket =
        socket
        |> assign(displayed_month: 12)
        |> update(:displayed_year, &(&1 - 1))

      {:noreply, socket}
    else
      {:noreply, update(socket, :displayed_month, &(&1 - 1))}
    end
  end

  def handle_event("next_month", _params, socket) do
    if socket.assigns.displayed_month == 12 do
      socket =
        socket
        |> assign(displayed_month: 1)
        |> update(:displayed_year, &(&1 + 1))

      {:noreply, socket}
    else
      {:noreply, update(socket, :displayed_month, &(&1 + 1))}
    end
  end

  def button_styles(event_name) do
    case event_name do
      "Improv Games" -> "bg-green-500 -rotate-6"
      "House Jam" -> "bg-yellow-500 rotate-3"
      "Troupe Jam" -> "bg-red-500 rotate-6"
      _ -> "bg-purple-500"
    end
  end
end
