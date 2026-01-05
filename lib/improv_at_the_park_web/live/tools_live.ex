defmodule ImprovAtTheParkWeb.ToolsLive do
  use ImprovAtTheParkWeb, :live_view

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       page_title: "Workshop Tools - Improv at the Park",
       character_image: nil,
       character_description: nil,
       scene_prompt: %{
         location: nil,
         relationship: nil,
         word: nil
       }
     )}
  end

  @impl Phoenix.LiveView
  def handle_event("generate-character-image", _params, socket) do
    character_image = ImprovAtThePark.Tools.generate_character_image()
    {:noreply, assign(socket, character_image: character_image)}
  end

  @impl Phoenix.LiveView
  def handle_event("generate-character-description", _params, socket) do
    character_description = ImprovAtThePark.Tools.generate_character_description()
    {:noreply, assign(socket, character_description: character_description)}
  end

  @impl Phoenix.LiveView
  def handle_event("generate-scene-prompt", _params, socket) do
    scene_prompt = ImprovAtThePark.Tools.generate_scene_prompt()
    {:noreply, assign(socket, scene_prompt: scene_prompt)}
  end
end
