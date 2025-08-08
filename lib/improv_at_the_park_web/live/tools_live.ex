defmodule ImprovAtTheParkWeb.ToolsLive do
  use ImprovAtTheParkWeb, :live_view

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok, assign(socket,
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
    # Placeholder for character image generation
    # In a real implementation, this would call an AI service
    character_image = "https://via.placeholder.com/300x400/4ade80/ffffff?text=Character+Image"

    {:noreply, assign(socket, character_image: character_image)}
  end

  @impl Phoenix.LiveView
  def handle_event("generate-character-description", _params, socket) do
    # Placeholder for character description generation
    descriptions = [
      "A retired librarian who secretly writes romance novels under a pen name",
      "A street musician who can play any instrument but is tone deaf",
      "A chef who's allergic to their own cooking",
      "A detective who solves crimes by talking to plants",
      "A time traveler who's always late because they can't figure out time zones",
      "A superhero whose power is making people yawn",
      "A ghost who's afraid of the dark",
      "A robot who's learning to be human by watching soap operas",
      "A wizard who can only cast spells when they're sneezing",
      "A pirate who gets seasick on boats"
    ]

    character_description = Enum.random(descriptions)
    {:noreply, assign(socket, character_description: character_description)}
  end

  @impl Phoenix.LiveView
  def handle_event("generate-scene-prompt", _params, socket) do
    locations = [
      "A laundromat at 3 AM",
      "A pet store during a power outage",
      "A library where all the books are written in invisible ink",
      "A restaurant where the chef only cooks with ingredients that start with 'P'",
      "A gym where all the equipment is made of marshmallows",
      "A movie theater showing films backwards",
      "A grocery store where everything is free but you have to sing to get it",
      "A dentist's office where the dentist is afraid of teeth",
      "A bank where money grows on trees",
      "A school where the students teach the teachers"
    ]

    relationships = [
      "Long-lost siblings who just discovered they're actually twins",
      "Former business partners who now run competing hot dog stands",
      "Neighbors who have been living next to each other for 20 years but just met",
      "Teacher and student who accidentally switched bodies",
      "Doctor and patient who are both hypochondriacs",
      "Landlord and tenant who are secretly in love",
      "Chef and food critic who are secretly married",
      "Police officer and criminal who are best friends",
      "Boss and employee who are actually the same person",
      "Strangers who discover they're living the same day over and over"
    ]

    words = [
      "pineapple",
      "accordion",
      "bubblegum",
      "telescope",
      "spaghetti",
      "umbrella",
      "dragon",
      "penguin",
      "volcano",
      "chocolate"
    ]

    scene_prompt = %{
      location: Enum.random(locations),
      relationship: Enum.random(relationships),
      word: Enum.random(words)
    }

    {:noreply, assign(socket, scene_prompt: scene_prompt)}
  end

  @impl Phoenix.LiveView
  def handle_event("generate-all", _params, socket) do
    # Generate all prompts at once
    socket = socket
    |> handle_event("generate-character-description", %{})
    |> handle_event("generate-scene-prompt", %{})

    {:noreply, socket}
  end
end
