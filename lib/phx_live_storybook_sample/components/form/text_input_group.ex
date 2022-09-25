defmodule PhxLiveStorybookSample.Components.Form.TextInputGroup do
  use PhxLiveStorybookSample, :component
  import PhxComponentHelpers

  import PhxLiveStorybookSample.Components.Form.{Error, Hint, InputGroup, Label, TextInput}

  attr :form, Phoenix.HTML.Form, doc: "The form structure holding form data."
  attr :field, :atom, doc: "The form field key."
  attr :name, :string, doc: "The input name."
  attr :label, :string, doc: "The input label."
  attr :value, :string, doc: "The input value."
  attr :placeholder, :string, doc: "The input placeholder."
  attr :hint, :string, doc: "An hint to display below the input."
  attr :addon, :string, doc: "A short label that will be preprended to your input"
  attr :icon, :string, doc: "A font awesome icon class that will be prepended to the input."

  attr :disabled, :boolean,
    default: false,
    doc: "To allow input change or not. The default value will not be submitted."

  def text_input_group(assigns) do
    assigns
    |> set_form_attributes()
    |> validate_required_attributes([:name])
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <.input_group {forward_assigns(assigns, prefix: :group)}>
      <%= if assigns[:label] do %>
        <.form_label {forward_assigns(assigns, prefix: :label, take: [:for, :form, :field, :name])} />
      <% end %>

      <.text_input {forward_assigns(assigns, prefix: :text_input, take: input_assign_keys())} />

      <%= if assigns[:hint] do %>
        <.hint {forward_assigns(assigns, prefix: :hint)} />
      <% end %>

      <.error {forward_assigns(assigns, prefix: :error, take: [:form, :field])} />
    </.input_group>
    """
  end

  defp input_assign_keys do
    ~w(id name value form field placeholder phx-debounce type addon icon theme disabled)a
  end
end
