defmodule ImprovAtTheParkWeb.HomeLive do
  use ImprovAtTheParkWeb, :live_view

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    next_session = ImprovAtThePark.Events.get_next_session_info()

    socket =
      assign(socket,
        page_title: "Improv at the Park - Welcome",
        next_session: next_session,
        contact_info: %{
          email: "hello@improvatthepark.com",
          location: "Central Park • Every Saturday",
          phone: "(555) 123-4567"
        }
      )

    if connected?(socket) do
      events = ImprovAtThePark.Events.get_events()
      {:ok, assign(socket, events: events)}
    else
      {:ok, socket}
    end
  end

  @impl Phoenix.LiveView
  def handle_event("scroll-to", %{"section" => section}, socket) do
    {:noreply, push_event(socket, "scroll-to-section", %{section: section})}
  end

  @impl Phoenix.LiveView
  def handle_event("show-details", %{"show-id" => show_id}, socket) do
    show = Enum.find(socket.assigns.shows, &(&1.id == String.to_integer(show_id)))
    {:noreply, push_event(socket, "show-modal", %{show: show})}
  end

  @impl Phoenix.LiveView
  def handle_event("close-modal", _params, socket) do
    {:noreply, push_event(socket, "close-modal", %{})}
  end

  def get_color_classes(color, type \\ "bg") do
    case color do
      "sage" -> "#{type}-green-100"
      "mint" -> "#{type}-emerald-100"
      "forest" -> "#{type}-teal-100"
      _ -> "#{type}-green-100"
    end
  end

  def get_color_classes_dark(color) do
    case color do
      "sage" -> "bg-green-200 text-green-800"
      "mint" -> "bg-emerald-200 text-emerald-800"
      "forest" -> "bg-teal-200 text-teal-800"
      _ -> "bg-green-200 text-green-800"
    end
  end

  def get_color_classes_border(color) do
    case color do
      "sage" -> "border-green-200"
      "mint" -> "border-emerald-200"
      "forest" -> "border-teal-200"
      _ -> "border-green-200"
    end
  end
end
