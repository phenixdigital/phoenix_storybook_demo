defmodule Storybook.Components.Buttons.Button do
  alias PhoenixStorybookSample.Components.Button

  use PhoenixStorybook.Story, :component

  def function, do: &Button.button/1

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default button",
        attributes: %{
          label: "Boom!"
        }
      },
      %Variation{
        id: :custom_colors,
        description: "A button with custom colors",
        attributes: %{
          label: "A button",
          class: "bg-fuchsia-600 hover:bg-fuchsia-700"
        }
      }
    ]
  end
end
