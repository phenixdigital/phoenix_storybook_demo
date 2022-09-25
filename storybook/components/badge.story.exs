defmodule Storybook.Components.Badge do
  use PhxLiveStorybook.Story, :component

  def function, do: &PhxLiveStorybookSample.Components.Badge.badge/1
  def description, do: "Just a badge component, with colors."

  def variations do
    [
      %Variation{
        id: :default_badge,
        attributes: %{
          text: "Default badge",
          rest: %{"data-foo" => "bar", "qix" => 42}
        }
      },
      %VariationGroup{
        id: :predefined_colors,
        description: "With predefined colors",
        variations:
          for color <- ~w(info primary success warning danger)a do
            %Variation{
              id: color,
              attributes: %{
                text: "Predefined color",
                color: color
              }
            }
          end
      },
      %VariationGroup{
        id: :small_predefined_colors,
        description: "With predefined colors, but small",
        variations:
          for color <- ~w(info primary success warning danger)a do
            %Variation{
              id: color,
              attributes: %{
                text: "Same but small",
                color: color,
                small: true
              }
            }
          end
      },
      %VariationGroup{
        id: :custom_colors,
        description: "With custom colors",
        variations:
          for color <- ["#FC08CB", "#996CC0", "#7CACDD"] do
            %Variation{
              id: String.to_atom(color),
              attributes: %{
                text: "Custom color",
                hex_color: color
              }
            }
          end
      },
      %VariationGroup{
        id: :icons,
        description: "With FontAwesome icons",
        variations:
          for icon <- ["fa fa-alicorn", "fa fa-bolt", "fas fa-skull"] do
            %Variation{
              id: String.to_atom(icon),
              attributes: %{
                text: icon,
                icon: icon
              }
            }
          end
      },
      %VariationGroup{
        id: :small_icons,
        description: "With FontAwesome icons, but small",
        variations:
          for icon <- ["fa fa-alicorn", "fa fa-bolt", "fas fa-skull"] do
            %Variation{
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
