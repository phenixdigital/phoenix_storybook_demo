defmodule Storybook.Components.Badge do
  alias PhxLiveStorybookSampleWeb.Components.Badge

  use PhxLiveStorybook.Entry, :component

  def function, do: &Badge.badge/1
  def description, do: "Just a badge component, with colors."

  def icon, do: "fat fa-badge-check"

  def stories do
    for i <- 1..5 do
      [
        %StoryGroup{
          id: :"custom_colors_#{i}",
          description: "With custom colors",
          stories:
            for color <- ~w(indigo purple pink) do
              %Story{
                id: :"custom_colors_#{i}_#{color}}",
                attributes: %{
                  :label => "#{color} badge",
                  :"text-color" => "text-white",
                  :"bg-color" => "bg-#{color}-600"
                }
              }
            end
        },
        %Story{
          id: :"default_badge_#{i}",
          attributes: %{
            :label => "A badge"
          }
        },
        %Story{
          id: :"with_an_icon_#{i}",
          description: "With a custom FontAwesome icon",
          attributes: %{
            :label => "Check",
            :icon => "fa fa-check"
          }
        },
        %Story{
          id: :"with_color_and_icon_#{i}",
          description: "With a custom FontAwesome icon & color",
          attributes: %{
            :label => "Danger",
            :icon => "fas fa-skull",
            :"text-color" => "text-red-700",
            :"bg-color" => "bg-red-200"
          }
        }
      ]
    end
    |> List.flatten()
  end
end
