defmodule PhxLiveStorybookSample.Components.Button do
  use PhxLiveStorybookSample, :component

  def button(assigns) do
    assigns
    |> assign_new(:theme, fn -> :not_set end)
    |> assign_new(:label, fn -> "" end)
    |> assign_new(:"bg-color", fn -> "bg-indigo-600" end)
    |> assign_new(:"hover-bg-color", fn -> "hover:bg-indigo-700" end)
    |> assign_new(:"text-color", fn -> "text-white" end)
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <button phx-click="boom" type="button" theme={@theme} class={"inline-flex items-center px-2.5 py-1.5 border border-transparent text-xs font-medium rounded shadow-sm #{assigns[:"text-color"]} #{assigns[:"bg-color"]} #{assigns[:"hover-bg-color"]} focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"}>
      <%= @label %>
    </button>
    """
  end
end
