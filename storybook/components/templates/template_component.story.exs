defmodule Storybook.TemplateComponent do
  use PhxLiveStorybook.Story, :component
  alias PhxLiveStorybookSample.Components.TemplateComponent

  def function, do: &TemplateComponent.template_component/1
  def description, do:
    """
    Technical component illustrating how templates and assign/toggle can be used together.
    """

  def template do
    """
    <div id=":variation_id" class="space-y-2" lsb-code-hidden>
      <button class="btn" id="set-foo" phx-click={JS.push("assign", value: %{label: "foo"})}>Set label to foo</button>
      <button class="btn" id="set-bar" phx-click={JS.push("assign", value: %{label: "bar"})}>Set label to bar</button>
      <button class="btn" id="toggle-status" phx-click={JS.push("toggle", value: %{attr: :status})}>Toggle status</button>
      <button class="btn" id="set-status-true" phx-click={JS.push("assign", value: %{status: true})}>Set status to true</button>
      <button class="btn" id="set-status-false" phx-click={JS.push("assign", value: %{status: false})}>Set status to false</button>
      <div class="mt-2">
        <.lsb-variation/>
      </div>
    </div>
    """
  end

  def attributes do
    [
      %Attr{
        id: :label,
        type: :string,
        doc: "component label"
      },
      %Attr{
        id: :status,
        type: :boolean,
        doc: "component status",
        default: false
      }
    ]
  end

  def variations do
    [
      %Variation{
        id: :hello,
        description: "Hello story",
        attributes: %{label: "hello"}
      },
      %Variation{
        id: :world,
        description: "World story",
        attributes: %{label: "world"}
      },
      %Variation{
        id: :value_template,
        template: """
        <.lsb-variation label={"coucou"}/>
        """
      },
      %VariationGroup{
        id: :group,
        variations: [
          %Variation{
            id: :one,
            attributes: %{label: "one", status: false}
          },
          %Variation{
            id: :two,
            attributes: %{label: "two", status: false}
          }
        ]
      }
    ]
  end
end
