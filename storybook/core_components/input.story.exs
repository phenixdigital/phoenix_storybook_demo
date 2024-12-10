defmodule Storybook.CoreComponents.Input do
  use PhoenixStorybook.Story, :component

  def function, do: &PhoenixStorybookDemo.CoreComponents.input/1
  def render_only_function_source, do: true

  def variations do
    [
      %Variation{
        id: :default_input,
        attributes: %{
          label: "Input label",
          name: "label",
          value: "foo"
        }
      }]
    end

end
