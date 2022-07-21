defmodule PhxLiveStorybookSampleWeb.Components.Badge do
  use PhxLiveStorybookSampleWeb, :component

  def badge(assigns) do
    assigns
    |> assign_new(:label, fn -> "" end)
    |> assign_new(:"bg-color", fn -> "bg-gray-100" end)
    |> assign_new(:"text-color", fn -> "text-gray-800" end)
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <span class={"inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium #{assigns[:"bg-color"]} #{assigns[:"text-color"]}"}>
      <%= @label %>
    </span>
    """
  end
end
