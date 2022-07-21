defmodule PhxLiveStorybookSampleWeb.Storybook.Components.Buttons.Button do
  alias PhxLiveStorybookSampleWeb.Components.Button

  use PhxLiveStorybook.Component

  def component, do: Button
  def function, do: &Button.button/1
  def description, do: "A simple generic button."

  def variations do
    [
      default: %{
        label: "A button"
      },
      custom_colors: %{
        :label => "A button",
        :"bg-color" => "bg-green-600",
        :"hover-bg-color" => "bg-green-700"
      }
    ]
  end
end
