defmodule Storybook.Components.Badge do
  alias PhxLiveStorybookSampleWeb.Components.Badge

  use PhxLiveStorybook.Entry, :component

  def component, do: Badge
  def function, do: &Badge.badge/1
  def description, do: "Just a badge component, with colors."
  def icon, do: "fal fa-badge-check"

  def variations do
    [
      %Variation{
        id: :default_badge,
        attributes: %{
          :label => "A badge"
        }
      },
      %Variation{
        id: :with_custom_colors,
        attributes: %{
          :label => "An indigo badge",
          :"text-color" => "text-white",
          :"bg-color" => "bg-indigo-600"
        }
      },
      %Variation{
        id: :with_an_icon,
        description: "With a custom FontAwesome icon",
        attributes: %{
          :label => "A check badge",
          :icon => "fa fa-check"
        }
      },
      %Variation{
        id: :with_color_and_icon,
        description: "With a custom FontAwesome icon",
        attributes: %{
          :label => "Danger",
          :icon => "fas fa-skull",
          :"text-color" => "text-red-700",
          :"bg-color" => "bg-red-200"
        }
      }
    ]
  end
end
