defmodule PhoenixStorybookDemo.Components.Form.Error do
  use PhoenixStorybookDemo, :component
  import PhxComponentHelpers

  @default_class "form-error-message text-danger text-sm"

  def error(assigns) do
    assigns
    |> extend_class(@default_class, prefix_replace: false)
    |> set_form_attributes()
    |> set_phx_attributes()
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <%= if Enum.any?(@errors) do %>
      <div>
        <%= for error <- @errors do %>
          <p {@heex_class}>
            <%= print_error(error) %>
          </p>
        <% end %>
      </div>
    <% end %>
    """
  end

  defp print_error({error, _}), do: error
end
