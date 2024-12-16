defmodule PhoenixStorybookDemo.Components.Live.LiveButton do
  @moduledoc """
  A LiveComponent button, with some state. Will change its color every time you click it
  """
  use PhoenixStorybookDemo, :live_component

  attr :label, :string, required: true, doc: "Button label"
  attr :color, :atom, values: ~w(indigo yellow red purple emerald)a, doc: "Button color"

  def render(assigns) do
    ~H"""
    <button
      id={assigns[:id]}
      class={button_class(assigns)}
      phx-click="change_color"
      phx-target={@myself}
    >
      <%= @label %>
    </button>
    """
  end

  def update(assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:label, fn -> "" end)
     |> assign_new(:color, &random_color/0)}
  end

  def handle_event("change_color", _, socket) do
    {:noreply, assign(socket, color: random_color())}
  end

  defp button_class(assigns) do
    "inline-flex items-center px-4 py-2 border border-transparent text-sm\
    font-medium rounded-md shadow-sm text-white #{color_style(assigns)}"
  end

  defp random_color, do: Enum.random([:indigo, :yellow, :red, :purple, :emerald])

  defp color_style(%{color: :indigo}), do: "bg-indigo-600 dark:bg-indigo-800 hover:bg-indigo-700"
  defp color_style(%{color: :yellow}), do: "bg-yellow-400 dark:bg-yellow-600 hover:bg-yellow-500"
  defp color_style(%{color: :red}), do: "bg-red-600 dark:bg-red-800 hover:bg-red-700"
  defp color_style(%{color: :purple}), do: "bg-purple-600 dark:pg-purple-800 hover:bg-purple-700"

  defp color_style(%{color: :emerald}),
    do: "bg-emerald-600 dark:bg-emerald-800 hover:bg-emerald-700"
end
