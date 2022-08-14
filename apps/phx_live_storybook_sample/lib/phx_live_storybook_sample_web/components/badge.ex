defmodule PhxLiveStorybookSampleWeb.Components.Badge do
  use PhxLiveStorybookSampleWeb, :component
  import PhxComponentHelpers

  @default_span_class "inline-flex items-center text-nowrap font-medium cursor-pointer "

  def badge(assigns) do
    assigns
    |> set_attributes(
      [
        :id,
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
    <span style={@inline_style} {@heex_class} {@heex_id}>
      <%= if @icon do %>
        <i {@heex_icon_class}></i>
      <% end %>
      <%= @text %>
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

  defp color_and_small_class(%{color: color, small: small?}) do
    class = @default_span_class

    class =
      case color do
        :info ->
          class <> " bg-blue-500 hover:bg-blue-700 text-white"

        :primary ->
          class <> " bg-indigo-500 hover:bg-indigo-700 text-white"

        :success ->
          class <> " bg-green-500 hover:bg-green-700 text-white"

        :warning ->
          class <> " bg-orange-500 hover:bg-orange-700 text-white"

        :danger ->
          class <> " bg-red-500 hover:bg-red-700 text-white"

        _ ->
          class <>
            " border border-gray-200 bg-gray-300 text-gray-700 hover:bg-gray-500 hover:text-white"
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
