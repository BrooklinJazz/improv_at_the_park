defmodule ImprovAtThePark.Events.Event do
  @moduledoc """
  Struct for basic event information.

  Takes the following map response from the Eventbrite API and converts it into a struct:

  ```
   %{
   "is_series" => false,
   "facebook_event_id" => nil,
   "show_seatmap_thumbnail" => false,
   "capacity_is_custom" => false,
   "is_reserved_seating" => false,
   "shareable" => true,
   "show_colors_in_seatmap_thumbnail" => false,
   "listed" => true,
   "online_event" => false,
   "is_locked" => false,
   "end" => %{
     "local" => "2026-01-21T21:30:00",
     "timezone" => "America/Montreal",
     "utc" => "2026-01-22T02:30:00Z"
   },
   "created" => "2026-01-05T02:21:11Z",
   "tx_time_limit" => 1200,
   "source" => "coyote",
   "logo" => %{
     "aspect_ratio" => "2",
     "crop_mask" => nil,
     "edge_color" => "#f9f6f1",
     "edge_color_set" => true,
     "id" => "1173972586",
     "original" => %{
       "height" => 1080,
       "url" => "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F1173972586%2F408207415789%2F1%2Foriginal.20260105-020645?auto=format%2Ccompress&q=75&sharp=10&s=033e47d8d6b69352d85d1123343d6cf7",
       "width" => 2160
     },
     "url" => "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F1173972586%2F408207415789%2F1%2Foriginal.20260105-020645?crop=focalpoint&fit=crop&h=200&w=450&auto=format%2Ccompress&q=75&sharp=10&fp-x=0.494&fp-y=0.427&s=c36314f805545e2aabff9feed71d90e7"
   },
   "invite_only" => false,
   "capacity" => 50,
   "status" => "live",
   "summary" => "Step on stage or enjoy the show! Join our high-energy Improv Jam where experienced improvisers and first-timers create comedy on the fly.",
   "description" => %{
     "html" => "Step on stage or enjoy the show! Join our high-energy Improv Jam where experienced improvisers and first-timers create comedy on the fly.",
     "text" => "Step on stage or enjoy the show! Join our high-energy Improv Jam where experienced improvisers and first-timers create comedy on the fly."
   },
   "name" => %{"html" => "Improv Games", "text" => "Improv Games"},
   "id" => "1979685571837",
   "organizer_id" => "32255922907",
   "format_id" => "14",
   "start" => %{
     "local" => "2026-01-21T19:30:00",
     "timezone" => "America/Montreal",
     "utc" => "2026-01-22T00:30:00Z"
   },
   "show_pick_a_seat" => false,
   "currency" => "USD",
   "category_id" => "105",
   "published" => "2026-01-05T02:34:40Z",
   "url" => "https://www.eventbrite.ca/e/improv-games-tickets-1979685571837",
   "hide_start_date" => false,
   "show_remaining" => false,
   "is_free" => true,
   "logo_id" => "1173972586",
   "changed" => "2026-01-05T02:53:08Z",
   "resource_uri" => "https://www.eventbriteapi.com/v3/events/1979685571837/",
   "locale" => "en_US",
   "subcategory_id" => "5010",
   "venue_id" => "295809119",
   "hide_end_date" => false,
   "privacy_setting" => "unlocked",
   "is_externally_ticketed" => false,
   "is_series_parent" => false,
   "organization_id" => "506923001449",
   "inventory_type" => "limited",
   "version" => nil
   }
   ```
  """

  defstruct [
    :venue,
    :cover_image_url,
    :description,
    :finish,
    :id,
    :name,
    :start,
    :status,
    :summary,
    :published,
    :url
  ]
end
