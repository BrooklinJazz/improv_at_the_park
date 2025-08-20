defmodule ImprovAtThePark.Tools do
  @moduledoc """
  Tools module for generating improv workshop content including characters, scenes, and prompts.
  """

  # Character descriptions for scene prompts
  @character_descriptions [
    "A retired librarian who secretly writes romance novels under a pen name",
    "A street musician who can play any instrument but is tone deaf",
    "A chef who's allergic to their own cooking",
    "A detective who solves crimes by talking to plants",
    "A time traveler who's always late because they can't figure out time zones",
    "A superhero whose power is making people yawn",
    "A ghost who's afraid of the dark",
    "A robot who's learning to be human by watching soap operas",
    "A wizard who can only cast spells when they're sneezing",
    "A pirate who gets seasick on boats",
    "A professional mime who's actually very talkative",
    "A weather forecaster who can't predict their own mood",
    "A dentist who's terrified of teeth",
    "A professional athlete who's allergic to winning",
    "A scientist who believes in magic",
    "A teacher who's learning from their students",
    "A doctor who's a hypochondriac",
    "A police officer who's afraid of the dark",
    "A firefighter who's scared of fire",
    "A pilot who's afraid of heights"
  ]

  # Locations for scene prompts
  @locations [
    "A laundromat at 3 AM",
    "A pet store during a power outage",
    "A library where all the books are written in invisible ink",
    "A restaurant where the chef only cooks with ingredients that start with 'P'",
    "A gym where all the equipment is made of marshmallows",
    "A movie theater showing films backwards",
    "A grocery store where everything is free but you have to sing to get it",
    "A dentist's office where the dentist is afraid of teeth",
    "A bank where money grows on trees",
    "A school where the students teach the teachers",
    "A hospital where the doctors are all patients",
    "A museum where the exhibits come to life at night",
    "A coffee shop where the coffee makes you invisible",
    "A park where gravity works sideways",
    "A subway station that only goes to yesterday",
    "A hotel where every room is a different time period",
    "A zoo where the animals are the zookeepers",
    "A circus where the audience performs for the performers",
    "A beach where the sand is made of tiny mirrors",
    "A forest where the trees can walk"
  ]

  # Relationships for scene prompts
  @relationships [
    "Long-lost siblings who just discovered they're actually twins",
    "Former business partners who now run competing hot dog stands",
    "Neighbors who have been living next to each other for 20 years but just met",
    "Teacher and student who accidentally switched bodies",
    "Doctor and patient who are both hypochondriacs",
    "Landlord and tenant who are secretly in love",
    "Chef and food critic who are secretly married",
    "Police officer and criminal who are best friends",
    "Boss and employee who are actually the same person",
    "Strangers who discover they're living the same day over and over",
    "Siblings who are convinced they're adopted",
    "Ex-spouses who are still living together",
    "Roommates who are actually long-lost cousins",
    "Coworkers who are secretly superheroes",
    "Strangers who share the same birthday and name",
    "Parent and child who are the same age",
    "Best friends who just found out they're related",
    "Enemies who are actually in love",
    "Strangers who are psychic twins",
    "Acquaintances who are actually time travelers from the same future"
  ]

  # Words for scene prompts
  @words [
    "pineapple",
    "accordion",
    "bubblegum",
    "telescope",
    "spaghetti",
    "umbrella",
    "dragon",
    "penguin",
    "volcano",
    "chocolate",
    "butterfly",
    "rainbow",
    "moonlight",
    "sunshine",
    "thunder",
    "whisper",
    "laughter",
    "silence",
    "adventure",
    "mystery"
  ]

  @doc """
  Generates a character image URL.
  Currently returns a placeholder, but can be extended to call AI image generation services.
  """
  def generate_character_image do
    # Placeholder for character image generation
    # In a real implementation, this would call an AI service like DALL-E, Midjourney, etc.
    "https://via.placeholder.com/300x400/4ade80/ffffff?text=Character+Image"
  end

  @doc """
  Generates a random character description from a curated list.
  """
  def generate_character_description do
    Enum.random(@character_descriptions)
  end

  @doc """
  Generates a random location for scene prompts.
  """
  def generate_location do
    Enum.random(@locations)
  end

  @doc """
  Generates a random relationship for scene prompts.
  """
  def generate_relationship do
    Enum.random(@relationships)
  end

  @doc """
  Generates a random word for scene prompts.
  """
  def generate_word do
    Enum.random(@words)
  end

  @doc """
  Generates a complete scene prompt with location, relationship, and word.
  """
  def generate_scene_prompt do
    %{
      location: generate_location(),
      relationship: generate_relationship(),
      word: generate_word()
    }
  end

  @doc """
  Generates all workshop content at once.
  """
  def generate_all do
    %{
      character_image: generate_character_image(),
      character_description: generate_character_description(),
      scene_prompt: generate_scene_prompt()
    }
  end
end
