defmodule Storybook.Components.List do
  use PhoenixStorybook.Story, :component

  def function, do: &PhoenixStorybookSample.Components.List.list/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          entries: ~w(hata godfrey sami )
        },
        let: :entry,
        slots: [
          """
          <%= for i <- 1..4 do %>
            <p> <br><%= i %>.<%= entry %>#<br></p>
          <% end %>
          """
        ]
      }
    ]
  end
end
