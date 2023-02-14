defmodule Storybook.Components.Buttons.ButtonIframe do
  alias PhoenixStorybookSample.Components.Button

  use PhoenixStorybook.Story, :component

  def function, do: &Button.button/1
  def container, do: :iframe

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
          :label => "A button",
          :"bg-color" => "bg-green-600",
          :"hover-bg-color" => "bg-green-700"
        }
      }
    ]
  end
end
