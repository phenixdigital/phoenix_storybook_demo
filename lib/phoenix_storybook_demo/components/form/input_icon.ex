defmodule PhoenixStorybookDemo.Components.Form.InputIcon do
  use PhoenixStorybookDemo, :component
  import PhxComponentHelpers

  def input_icon(assigns) do
    assigns
    |> validate_required_attributes([:icon])
    |> extend_class("relative rounded-md shadow-sm w-full", attribute: :wrapper_class)
    |> extend_class("absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none",
      attribute: :icon_wrapper_class
    )
    |> extend_class("text-gray-300 #{assigns[:icon]}", attribute: :icon_class)
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <div {@heex_wrapper_class}>
      <div {@heex_icon_wrapper_class}>
        <i {@heex_icon_class}></i>
      </div>
      {render_slot(@inner_block)}
    </div>
    """
  end
end
