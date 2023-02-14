defmodule PhoenixStorybookSample.Components.Form.InputGroup do
  use PhoenixStorybookSample, :component
  import PhxComponentHelpers

  @default_class "md:col-span-6 space-y-2"

  def input_group(assigns) do
    assigns
    |> extend_class(@default_class, prefix_replace: false)
    |> set_phx_attributes()
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <div {@heex_class} {@heex_phx_attributes}>
      <%= render_block(@inner_block) %>
    </div>
    """
  end
end
