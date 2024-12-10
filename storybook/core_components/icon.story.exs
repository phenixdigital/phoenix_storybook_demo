defmodule Storybook.CoreComponents.Icon do
  use PhoenixStorybook.Story, :component

  def function, do: &PhoenixStorybookDemo.CoreComponents.icon/1
  def render_only_function_source, do: true

  def variations do
    [
      %Variation{
        id: :default_icon,
        attributes: %{
          name: "hero-x-mark-solid",
          class: "text-white"
        }
      }]
    end

end
