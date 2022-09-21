defmodule Storybook.Components.Buttons.Button do
  alias PhxLiveStorybookSample.Components.Button

  use PhxLiveStorybook.Story, :component

  def function, do: &Button.button/1
  def description, do: "A simple button. If you click, I'll raise!"

  def attributes do
    [
      %Attr{id: :label, type: :string, required: true, doc: "Button label"}
    ]
  end

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
