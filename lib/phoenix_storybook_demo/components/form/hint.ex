defmodule PhoenixStorybookDemo.Components.Form.Hint do
  use PhoenixStorybookDemo, :component
  import PhxComponentHelpers

  @default_class "text-default-txt-informative text-sm"

  def hint(assigns) do
    assigns
    |> extend_class(@default_class, prefix_replace: false)
    |> validate_required_attributes([:hint])
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <p {@heex_class}>
      {@hint}
    </p>
    """
  end
end
