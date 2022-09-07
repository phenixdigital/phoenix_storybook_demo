defmodule Storybook.Components.Buttons.Button do
  alias PhxLiveStorybookSampleWeb.Components.Button

  use PhxLiveStorybook.Entry, :component

  def function, do: &Button.button/1
  def description, do: "A simple button. If you click, I'll raise!"
  def icon, do: "fat fa-rectangle-ad"

  def attributes do
    [
      %Attr{id: :label, type: :string, required: true, doc: "Button label"}
    ]
  end

  def stories do
    [
      %Story{
        id: :default,
        description: "Default button",
        attributes: %{
          label: "Boom!"
        }
      },
      %Story{
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
