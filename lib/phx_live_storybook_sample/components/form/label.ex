defmodule PhxLiveStorybookSample.Components.Form.Label do
  use PhxLiveStorybookSample, :component
  import PhxComponentHelpers

  @default_class "block font-semibold text-sm"
  @not_error_class "text-default-txt"
  @error_class "form-error-message text-danger"

  def form_label(assigns) do
    assigns
    |> extend_class(&label_class/1, prefix_replace: false)
    |> set_form_attributes()
    |> set_attributes([:for], required: [:label])
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <label {@heex_for} {@heex_class}>
      <%= @label %>
    </label>
    """
  end

  defp label_class(assigns) do
    if has_errors?(assigns) do
     "#{@default_class} #{@error_class}"
     else
      "#{@default_class} #{@not_error_class}"
    end
  end
end
