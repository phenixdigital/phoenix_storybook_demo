defmodule Storybook.Components.Live.LiveButton do
  alias PhxLiveStorybookSampleWeb.Components.Live.LiveButton

  use PhxLiveStorybook.Entry, :live_component

  def component, do: LiveButton

  def description,
    do: """
    A LiveComponent button, with some state.
    Will change its color every time you click it
    """

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