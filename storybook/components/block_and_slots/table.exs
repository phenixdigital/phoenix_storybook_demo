defmodule Storybook.Components.Table do
  use PhxLiveStorybook.Entry, :component

  def function, do: &PhxLiveStorybookSample.Components.Table.table/1
  def description, do: "Illustration of how you can use slots with let."
  def icon, do: "fat fa-table"

  def attributes do
    [
      %Attr{id: :rows, type: :list, doc: "Data you want to list", required: true},
      %Attr{id: :col, type: :slot, doc: "Describe one of your table columns"}
    ]
  end

  def stories do
    [
      %Story{
        id: :default,
        attributes: %{
          rows: [
            %{first_name: "Jean", last_name: "Dupont", city: "Paris"},
            %{first_name: "Sam", last_name: "Smith", city: "NY"}
          ]
        },
        slots: [
          """
          <:col let={user} label="First name">
            <%= user.first_name %>
          </:col>
          """,
          """
          <:col let={user} label="Last name">
            <%= user.last_name %>
          </:col>
          """,
          """
          <:col let={user} label="City">
            <%= user.city %>
          </:col>
          """
        ]
      }
    ]
  end

end
