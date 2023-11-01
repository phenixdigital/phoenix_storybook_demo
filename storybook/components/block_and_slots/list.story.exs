defmodule Storybook.Components.List do
  use PhoenixStorybook.Story, :component

  def function, do: &PhoenixStorybookDemo.Components.List.list/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          entries: ~w(apple banana cherry)
        },
        let: :entry,
        slots: [
          """
          <%= for i <- 1..10 do %>
            <p>Item #<%= i %></p>
          <% end %>
          """
        ]
      }
    ]
  end
end
