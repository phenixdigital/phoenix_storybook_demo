defmodule Storybook.Components.TextInput do
  use PhoenixStorybook.Story, :component
  alias PhoenixStorybookDemo.Components.Form.TextInputGroup

  def function, do: &TextInputGroup.text_input_group/1

  def template do
    """
    <.form for={%{}} as={:story} :let={f} class="w-full">
      <.psb-variation form={f}/>
    </.form>
    """
  end

  def variations do
    [
      %Variation{
        id: :default_text_input,
        attributes: %{
          field: :address,
          placeholder: "Please type your address",
          label: "Address"
        }
      },
      %Variation{
        id: :with_hint,
        attributes: %{
          field: :address,
          placeholder: "Please type your address",
          label: "Address",
          hint: "Your full postal address."
        }
      },
      %Variation{
        id: :in_error,
        template: """
        <.form for={%{}} as={:story} :let={f} class="w-full">
          <% f = %{f | data: %{foo: "not valid"}, errors: [foo: {"this field is in error", []}]} %>
          <.psb-variation form={f}/>
        </.form>
        """,
        attributes: %{
          label: "Foo field",
          field: :foo
        }
      }
    ]
  end
end
