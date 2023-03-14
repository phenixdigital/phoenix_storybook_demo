defmodule PhoenixStorybookSample.Components.Button do
  use PhoenixStorybookSample, :component

  attr :label, :string, required: true, doc: "Button label"
  attr :class, :string, default: nil
  attr :theme, :atom, default: :not_set

  @doc """
  A simple button. When clicked, triggers a `boom` event.
  """
  def button(assigns) do
    ~H"""
    <button
      phx-click="click"
      type="button"
      theme={@theme}
      class={[
        "inline-flex items-center px-2.5 py-1.5 border border-transparent text-xs font-medium",
        "rounded shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500",
        "bg-indigo-600 hover:bg-indigo-700 text-white",
        @class
      ]}
    >
      <%= @label %>
    </button>
    """
  end
end
