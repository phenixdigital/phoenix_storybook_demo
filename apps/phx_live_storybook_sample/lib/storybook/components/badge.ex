defmodule Storybook.Components.Badge do
  alias PhxLiveStorybookSampleWeb.Components.Badge

  use PhxLiveStorybook.Entry, :component

  def component, do: Badge
  def function, do: &Badge.badge/1
  def description, do: "Just a badge."

  def variations do
    List.duplicate(
      %Variation{
        id: :custom_colors,
        attributes: %{
          :label => "A badge",
          :"text-color" => "text-white",
          :"bg-color" => "bg-indigo-600"
        }
      },
      20
    )
  end
end
