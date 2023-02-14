defmodule PhoenixStorybookSample.Components.List do
  use Phoenix.Component

  attr :entries, :list, doc: "Items you want to list", required: true
  slot(:inner_block, doc: "List items the way you want", required: true)

  @doc """
  Shows how you can use block with let.
  """
  def list(assigns) do
    ~H"""
    <ul role="list" class="divide-y divide-gray-200">
      <%= for entry <- @entries do %>
        <li class="flex py-4">
          <%= render_slot(@inner_block, entry) %>
        </li>
      <% end %>
    </ul>
    """
  end
end
