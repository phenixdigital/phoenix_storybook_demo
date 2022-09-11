defmodule Storybook.TemplateComponent do
  use PhxLiveStorybook.Entry, :component
  alias PhxLiveStorybookSample.Components.TemplateComponent
  def function, do: &TemplateComponent.template_component/1
  def name, do: "Set assigns"
  def description, do:
    """
    Technical component illustrating how templates and set-story-assign/toggle_story-assign
    can be used together.
    """
  def icon, do: "fat fa-code"

  def template do
    """
    <div id=":story_id" class="space-y-2" lsb-code-hidden>
      <button class="btn" id="set-foo" phx-click="set-story-assign/:story_id/label/foo">Set label to foo</button>
      <button class="btn" id="set-bar" phx-click="set-story-assign/:story_id/label/bar">Set label to bar</button>
      <button class="btn" id="toggle-status" phx-click="toggle-story-assign/:story_id/status">Toggle status</button>
      <button class="btn" id="set-status-true" phx-click="set-story-assign/:story_id/status/true">Set status to true</button>
      <button class="btn" id="set-status-false" phx-click="set-story-assign/:story_id/status/false">Set status to false</button>
      <div class="mt-2">
        <.lsb-story/>
      </div>
    </div>
    """
  end

  def attributes do
    [
      %Attr{
        id: :label,
        type: :string,
        doc: "component label",
        required: true
      },
      %Attr{
        id: :status,
        type: :boolean,
        doc: "component status",
        default: false
      }
    ]
  end

  def stories do
    [
      %Story{
        id: :hello,
        description: "Hello story",
        attributes: %{label: "hello"}
      },
      %Story{
        id: :world,
        description: "World story",
        attributes: %{label: "world"}
      },
      %StoryGroup{
        id: :group,
        stories: [
          %Story{
            id: :one,
            attributes: %{label: "one", status: false}
          },
          %Story{
            id: :two,
            attributes: %{label: "two", status: false}
          }
        ]
      }
    ]
  end
end
