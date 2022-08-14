defmodule PhxLiveStorybookSampleWeb.Components.Dropdown do
  use PhxLiveStorybookSampleWeb, :component
  import PhxComponentHelpers

  def dropdown(assigns) do
    assigns
    |> set_attributes([:text, color: :default, entry: []], required: [:text])
    |> extend_class(&color_class/1, prefix_replace: false, attribute: :color_class)
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <div
      id={@id}
      class="flex relative w-max"
      phx-hook="DropdownHook"
      data-content-class="dropdown-content bg-white flex flex-col w-max border absolute mt-1 bg-default-bg right-0 top-full z-10 rounded-md shadow-md py-1"
    >
      <button type="button" class={"#{@color_class} toggle-button inline-flex justify-center w-full rounded-md border shadow-sm px-4 py-2 text-sm font-medium focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-100 focus:ring-indigo-500"}>
        <%= @text %>
        <!-- Heroicon name: solid/chevron-down -->
        <svg class="-mr-1 ml-2 h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
          <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
        </svg>
      </button>

      <div class="dropdown-content hidden">
        <%= for %{path: path, text: text} <- @entry do %>
          <a href={path} class="text-gray-700 block px-4 py-2 text-sm" role="menuitem" tabindex="-1">
            <%= text %>
          </a>
        <% end %>
      </div>
    </div>
    """
  end

  defp color_class(_assigns = %{color: :default}) do
    "bg-white hover:bg-gray-50 text-gray-700 border-gray-300"
  end

  defp color_class(_assigns = %{color: :primary}) do
    "bg-indigo-500 hover:bg-indigo-700 text-white border-indigo-300"
  end
end
