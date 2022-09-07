defmodule PhxLiveStorybookSample.Components.List do
  use Phoenix.Component

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
