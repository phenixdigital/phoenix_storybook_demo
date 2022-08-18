defmodule Storybook.Components.Badge do
  use PhxLiveStorybook.Entry, :component

  def function, do: &PhxLiveStorybookSampleWeb.Components.Badge.badge/1
  def description, do: "Just a badge component, with colors."
  def container, do: :iframe

  def icon, do: "fat fa-badge-check"

  def attributes do
    [
      %Attr{id: :text, type: :string, required: true, doc: "Badge label"},
      %Attr{
        id: :color,
        type: :atom,
        doc: "One predefined color among a small set.",
        default: :default,
        options: ~w(default info primary success warning danger)a
      },
      %Attr{
        id: :hex_color,
        type: :string,
        doc: "Custom HEX color. Overrides :color attribute."
      },
      %Attr{
        id: :small,
        type: :boolean,
        default: false,
        doc: "When true, renders a smaller badge."
      },
      %Attr{
        id: :icon,
        type: :string,
        doc: "Prepends an icon to the badge. Use it with FontAwesome classes."
      }
    ]
  end

  def stories do
    [
      %Story{
        id: :default_badge,
        attributes: %{
          text: "Default badge"
        }
      },
      %StoryGroup{
        id: :predefined_colors,
        description: "With predefined colors",
        stories:
          for color <- ~w(info primary success warning danger)a do
            %Story{
              id: color,
              attributes: %{
                text: color |> to_string() |> String.capitalize(),
                color: color
              }
            }
          end
      },
      %StoryGroup{
        id: :small_predefined_colors,
        description: "With predefined colors, but small",
        stories:
          for color <- ~w(info primary success warning danger)a do
            %Story{
              id: color,
              attributes: %{
                text: color |> to_string() |> String.capitalize(),
                color: color,
                small: true
              }
            }
          end
      },
      %StoryGroup{
        id: :custom_colors,
        description: "With custom colors",
        stories:
          for color <- ["#FC08CB", "#996CC0", "#7CACDD"] do
            %Story{
              id: String.to_atom(color),
              attributes: %{
                text: color,
                hex_color: color
              }
            }
          end
      },
      %StoryGroup{
        id: :icons,
        description: "With FontAwesome icons",
        stories:
          for icon <- ["fa fa-alicorn", "fa fa-bolt", "fas fa-skull"] do
            %Story{
              id: String.to_atom(icon),
              attributes: %{
                text: icon,
                icon: icon
              }
            }
          end
      },
      %StoryGroup{
        id: :small_icons,
        description: "With FontAwesome icons, but small",
        stories:
          for icon <- ["fa fa-alicorn", "fa fa-bolt", "fas fa-skull"] do
            %Story{
              id: String.to_atom(icon),
              attributes: %{
                text: icon,
                icon: icon,
                small: true
              }
            }
          end
      }
    ]
  end
end
