defmodule PhxLiveStorybookSampleWeb.Components.Dropdown do
  use PhxLiveStorybookSampleWeb, :component

  def dropdown(assigns) do
    assigns
    |> assign_new(:id, &random_id/0)
    |> assign_new(:label, fn -> "" end)
    |> assign_new(:"bg-color", fn -> "bg-white" end)
    |> assign_new(:"hover-bg-color", fn -> "hover:bg-gray-50" end)
    |> assign_new(:"text-color", fn -> "text-gray-700" end)
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <div
      id={@id}
      class="flex relative w-max"
      phx-hook="DropdownHook"
      data-content-class="dropdown-content flex flex-col w-max border absolute mt-1 bg-default-bg right-0 top-full z-10 rounded-md shadow-md py-1"
    >
      <button type="button" class={"toggle-button inline-flex justify-center w-full rounded-md border border-gray-300 shadow-sm px-4 py-2 #{assigns[:"text-color"]} #{assigns[:"bg-color"]} #{assigns[:"hover-bg-color"]} text-sm font-medium focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-100 focus:ring-indigo-500"}>
        <%= @label %>
        <!-- Heroicon name: solid/chevron-down -->
        <svg class="-mr-1 ml-2 h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
          <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
        </svg>
      </button>

      <div class="dropdown-content hidden">
        <%= for entry <- @entry do %>
          <a href={entry.path} class="text-gray-700 block px-4 py-2 text-sm" role="menuitem" tabindex="-1">
            <%= entry.label %>
          </a>
        <% end %>
      </div>
    </div>
    """
  end

  defp random_id do
    123
  end
end
