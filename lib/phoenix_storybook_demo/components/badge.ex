defmodule PhoenixStorybookDemo.Components.Badge do
  use PhoenixStorybookDemo, :component
  import PhxComponentHelpers

  @default_span_class "inline-flex items-center justify-center text-nowrap font-medium cursor-pointer whitespace-nowrap"
  @colors ~w(default info primary success warning danger)a

  attr :text, :string, required: true, doc: "Badge label"
  attr :theme, :atom, default: :default, doc: "Component library theme"
  attr :color, :atom, default: :default, values: @colors, doc: "One color among a small set."
  attr :hex_color, :string, doc: "Custom HEX color. Overrides :color attribute."
  attr :small, :boolean, default: false, doc: "When true, renders a smaller badge."
  attr :icon, :string, doc: "Prepends an icon to the badge. Use it with FontAwesome classes."
  attr :rest, :global, doc: "Any HTML attribute."

  @doc """
  Just a badge component, with colors.
  """
  def badge(assigns) do
    assigns
    |> assign_new(:theme, fn -> :not_set end)
    |> set_attributes(
      [
        :text,
        color: :default,
        icon: false,
        small: false
      ],
      required: [:text]
    )
    |> extend_class(&color_and_small_class/1, prefix_replace: false)
    |> extend_class(&icon_class/1, attribute: :icon_class, prefix_replace: false)
    |> assign_new(:inline_style, fn ->
      if assigns[:hex_color], do: "background-color: #{assigns[:hex_color]};"
    end)
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <span style={@inline_style} {@heex_class} theme={@theme} {@rest}>
      <i :if={@icon} {@heex_icon_class}></i>
      {if assigns[:inner_block], do: render_slot(@inner_block), else: @text}
    </span>
    """
  end

  defp color_and_small_class(%{hex_color: _color, small: small?}) do
    class = @default_span_class <> " hover:opacity-75 text-white"

    if small? do
      class <> " px-1 py-0.5 rounded text-xs"
    else
      class <> " px-3 py-0.5 rounded-full text-sm"
    end
  end

  defp color_and_small_class(%{color: color, small: small?, theme: theme}) do
    class = @default_span_class

    class =
      case {color, theme} do
        {:info, :colorful} ->
          class <> " bg-cyan-500 hover:bg-cyan-700 text-white"

        {:info, _} ->
          class <> " bg-blue-500 hover:bg-blue-700 dark:bg-fuchsia-900 text-white"

        {:primary, :colorful} ->
          class <> " bg-fuchsia-500 hover:bg-fuchsia-700 text-white"

        {:primary, _} ->
          class <> " bg-indigo-500 hover:bg-indigo-700 text-white"

        {:success, :colorful} ->
          class <> " bg-lime-500 hover:bg-lime-700 text-white"

        {:success, _} ->
          class <> " bg-green-500 hover:bg-green-700 text-white"

        {:warning, :colorful} ->
          class <> " bg-amber-500 hover:bg-amber-700 text-white"

        {:warning, _} ->
          class <> " bg-orange-500 hover:bg-orange-700 text-white"

        {:danger, _} ->
          class <> " bg-red-500 hover:bg-red-700 text-white"

        {_, :colorful} ->
          class <>
            " border border-stone-200 bg-stone-300 text-stone-700 hover:bg-stone-500 hover:text-white"

        _ ->
          class <>
            " border border-gray-200 dark:bg-pink-300 bg-gray-300 text-gray-700 hover:bg-gray-500 hover:text-white"
      end

    if small? do
      class <> " px-1 py-0.5 rounded text-xs"
    else
      class <> " px-3 py-0.5 rounded-full text-sm"
    end
  end

  defp icon_class(%{icon: icon}), do: "#{icon} pr-1"
  defp icon_class(_assigns), do: ""
end
