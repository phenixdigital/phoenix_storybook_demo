defmodule Storybook.Components.Live.LiveButton do
  alias PhoenixStorybookDemo.Components.Live.LiveButton

  use PhoenixStorybook.Story, :live_component

  def component, do: LiveButton

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          label: "A button"
        }
      },
      %Variation{
        id: :base_color,
        description: "With a base color in assigns",
        attributes: %{
          label: "A button",
          color: :indigo
        }
      }
    ]
  end
end
