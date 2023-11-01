defmodule Storybook.Components.Table do
  use PhoenixStorybook.Story, :component

  def function, do: &PhoenixStorybookDemo.Components.Table.table/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          rows: [
            %{first_name: "Jean", last_name: "Dupont", city: "Paris"},
            %{first_name: "Sam", last_name: "Smith", city: "NY"}
          ]
        },
        slots: [
          """
          <:col :let={user} label="First name">
            <%= user.first_name %>
          </:col>
          """,
          """
          <:col :let={user} label="Last name">
            <%= user.last_name %>
          </:col>
          """,
          """
          <:col :let={user} label="City">
            <%= user.city %>
          </:col>
          """
        ]
      }
    ]
  end
end
