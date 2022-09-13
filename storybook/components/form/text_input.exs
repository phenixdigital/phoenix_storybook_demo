defmodule Storybook.Components.TextInput do
  use PhxLiveStorybook.Entry, :component
  alias PhxLiveStorybookSample.Components.Form.TextInputGroup
  alias Phoenix.HTML.Form

  def function, do: &TextInputGroup.text_input_group/1
  def icon, do: "fat fa-input-text"

  def imports do
    [{Phoenix.LiveView.Helpers, [{:form, 1}]}]
  end

  def template do
    """
    <.form for={:story} let={f} class="w-full">
      <.lsb-story form={f}/>
    </.form>
    """
  end

  def attributes do
    [
      %Attr{
        id: :form,
        type: Form,
        doc: "The form structure holding form data."
      },
      %Attr{
        id: :field,
        type: :atom,
        doc: "The form field key."
      },
      %Attr{
        id: :name,
        type: :string,
        doc: "The input name."
      },
      %Attr{
        id: :label,
        type: :string,
        doc: "The input label."
      },
      %Attr{
        id: :value,
        type: :string,
        doc: "The input value."
      },
      %Attr{
        id: :placeholder,
        type: :string,
        doc: "The input placeholder."
      },
      %Attr{
        id: :hint,
        type: :string,
        doc: "An hint to display below the input."
      },
      %Attr{
        id: :addon,
        type: :string,
        doc: "A short label that will be preprended to your input"
      },
      %Attr{
        id: :icon,
        type: :string,
        doc: "A font awesome icon class that will be prepended to the input."
      },
      %Attr{
        id: :disabled,
        type: :boolean,
        default: false,
        doc: "To allow input change or not. The default value will not be submitted."
      }
    ]
  end

  def stories do
    [
      %Story{
        id: :default_text_input,
        attributes: %{
          field: :address,
          placeholder: "Please type your address",
          label: "Address"
        }
      },
      %Story{
        id: :with_hint,
        attributes: %{
          field: :address,
          placeholder: "Please type your address",
          label: "Address",
          hint: "Your full postal address."
        }
      },
      %Story{
        id: :in_error,
        template: """
        <.form for={:story} let={f} class="w-full">
          <% f = %{f | data: %{foo: "not valid"}, errors: [foo: {"this field is in error", []}]} %>
          <.lsb-story form={f}/>
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
