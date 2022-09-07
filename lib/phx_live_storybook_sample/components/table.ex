
defmodule PhxLiveStorybookSample.Components.Table do
  use Phoenix.Component

  def table(assigns) do
    ~H"""
    <div class="flex flex-col">
      <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
          <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
            <table class="divide-gray-300">
              <thead class="bg-gray-50">
                <tr>
                  <%= for col <- @col do %>
                    <th class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900"><%= col.label %></th>
                  <% end %>
                </tr>
              </thead>
              <tbody class="divide-y divide-gray-200 bg-white">
                <%= for row <- @rows do %>
                  <tr>
                    <%= for col <- @col do %>
                      <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= render_slot(col, row) %></td>
                    <% end %>
                  </tr>
                <% end %>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
