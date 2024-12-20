defmodule Storybook.TemplateComponent do
  use PhoenixStorybook.Story, :component
  alias PhoenixStorybookDemo.Components.TemplateComponent

  def function, do: &TemplateComponent.template_component/1

  def template do
    """
    <div id=":variation_id" class="space-y-2" >
      <button class="btn" id="set-foo-:variation_id" phx-click={JS.push("psb-assign", value: %{label: "foo"})}>Set label to foo</button>
      <button class="btn" id="set-bar-:variation_id" phx-click={JS.push("psb-assign", value: %{label: "bar"})}>Set label to bar</button>
      <button class="btn" id="toggle-status-:variation_id" phx-click={JS.push("psb-toggle", value: %{attr: :status})}>Toggle status</button>
      <button class="btn" id="set-status-true-:variation_id" phx-click={JS.push("psb-assign", value: %{status: true})}>Set status to true</button>
      <button class="btn" id="set-status-false-:variation_id" phx-click={JS.push("psb-assign", value: %{status: false})}>Set status to false</button>
      <div class="mt-2">
        <.psb-variation/>
      </div>
    </div>
    """
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
        <.psb-variation label={"hey"} foo="zaehjzjjhejkazhekjazhejhazekzekjhazek jhzaejahzekjahzejhejkazhekjazhejhazekj"/>
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
