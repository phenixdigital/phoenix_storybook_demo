defmodule PhoenixStorybookDemo.Components.Form.InputAddon do
  use PhoenixStorybookDemo, :component
  import PhxComponentHelpers

  @wrapper_class "flex overflow-y-hidden border border-rounded focus-within:outline-none focus-within:ring-2 focus-within:ring-offset-2 mb-4 p-0"
  @addon_class "inline-flex items-center whitespace-nowrap px-3 text-default-txt bg-default-bg border-r border-default-border"

  def input_addon(assigns) do
    assigns
    |> extend_class(&addon_class/1, prefix_replace: false)
    |> extend_class(&wrapper_class/1, attribute: :wrapper_class, prefix_replace: false)
    |> validate_required_attributes([:addon])
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <div {@heex_wrapper_class}>
      <span {@heex_class}>
        <%= @addon %>
      </span>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  defp wrapper_class(assigns) do
    if has_errors?(assigns) do
      "#{@wrapper_class} form-input-error rounded-md"
    else
      "#{@wrapper_class} form-input rounded-md"
    end
  end

  defp addon_class(_assigns) do
    "#{@addon_class} text-sm h-10 rounded-l-md"
  end
end
