defmodule Storybook.Components.Live.SendUpdateCounter do
  alias PhoenixStorybookDemo.Components.Live.SendUpdateCounter

  use PhoenixStorybook.Story, :live_component

  def component, do: SendUpdateCounter

  def handle_info({:send_update_demo, id, next_count}, socket) do
    Phoenix.LiveView.send_update(SendUpdateCounter, id: id, count: next_count)
    {:noreply, socket}
  end

  def handle_info(_, socket), do: {:noreply, socket}

  def variations do
    [
      %Variation{
        id: :default,
        description: "click event is received by the story and propagated with send_update/2",
        attributes: %{
          label: "Request increment",
          count: 0
        }
      }
    ]
  end
end
