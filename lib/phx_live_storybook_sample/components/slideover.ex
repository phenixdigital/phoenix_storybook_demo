defmodule PhxLiveStorybookSample.Components.Slideover do
  use PhxLiveStorybookSample, :component

  def slideover(assigns) do
    assigns
    |> assign_new(:title, fn -> "Panel Title" end)
    |> render()
  end

  defp render(assigns = %{show: true}) do
    ~H"""
    <div class="relative z-10" aria-labelledby="slide-over-title" role="dialog" aria-modal="true">
      <div class="fixed inset-0 "></div>

      <div class="fixed inset-0 overflow-hidden">
        <div class="absolute inset-0 overflow-hidden">
          <div phx-click-away={assigns[:close_event]} class={"pointer-events-none fixed inset-y-0 #{position_class(assigns)} flex max-w-full"}>
            <div class="pointer-events-auto w-screen max-w-md">
              <div class="flex h-full flex-col overflow-y-scroll bg-white py-6 shadow-xl">
                <div class="px-4 sm:px-6">
                  <div class="flex items-start justify-between">
                    <h2 class="text-lg font-bold text-indigo-600" id="slide-over-title"><%= @title %></h2>
                    <div class="ml-3 flex h-7 items-center">
                      <%= if assigns[:close_event] do %>
                        <button type="button" phx-click={@close_event} class="border-0 cursor-pointer rounded-md bg-white text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                          <span class="sr-only">Close panel</span>
                          <!-- Heroicon name: outline/x-mark -->
                          <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                          </svg>
                        </button>
                      <% end %>
                    </div>
                  </div>
                </div>
                <div class="relative mt-6 flex-1 px-4 sm:px-6">
                  <div class="absolute inset-0 px-4 sm:px-6">
                    <div class="h-full border-2 border-dashed border-gray-200 p-4" aria-hidden="true">
                      <%= render_slot(@body) %>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp render(assigns), do: ~H""

  defp position_class(%{position: :right}), do: "right-0 pl-10"
  defp position_class(_), do: "left-0 pr-10"
end
