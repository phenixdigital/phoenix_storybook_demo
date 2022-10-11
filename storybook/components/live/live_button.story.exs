defmodule Storybook.Components.Live.LiveButton do
  alias PhxLiveStorybookSample.Components.Live.LiveButton

  use PhxLiveStorybook.Story, :live_component

  def component, do: LiveButton

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          label: "Click me"
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
