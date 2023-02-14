defmodule Storybook.Components.List do
  use PhoenixStorybook.Story, :component

  def function, do: &PhoenixStorybookSample.Components.List.list/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          entries: ~w(apple banana cherry)
        },
        let: :entry,
        slots: [
          "I like <%= entry %>"
        ]
      }
    ]
  end
end
