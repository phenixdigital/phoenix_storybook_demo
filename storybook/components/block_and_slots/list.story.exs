defmodule Storybook.Components.List do
  use PhxLiveStorybook.Story, :component

  def function, do: &PhxLiveStorybookSample.Components.List.list/1
  def description, do: "Show how you can use block with let."

  def attributes do
    [
      %Attr{id: :entries, type: :list, doc: "Items you want to list", required: true}
    ]
  end

  def slots do
    [
      %Slot{id: :inner_block, doc: "List items the way you want", required: true}
    ]
  end

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
