defmodule Storybook.Components.Slideover do
  use PhxLiveStorybook.Entry, :component

  def function, do: &PhxLiveStorybookSampleWeb.Components.Slideover.slideover/1
  def description, do: "A side panel that will slide over your document."

  def attributes do
    [
      %Attr{
        id: :show,
        doc: "Controls slide-over visibility",
        type: :boolean,
        default: false
      },
      %Attr{
        id: :position,
        doc: "Anchor position of the slide-over",
        type: :atom,
        options: [:left, :right],
        default: :left
      },
      %Attr{
        id: :close_event,
        doc:
          "Event that will be triggered when clicking the close button or outside of the slide-over",
        type: :string
      },
      %Attr{
        id: :title,
        doc: "Slide-over title",
        type: :string,
        default: "Panel Title"
      },
      %Attr{id: :body, doc: "Slideover content", type: :slot}
    ]
  end

  def template do
    """
    <div>
      <button type="button" class="btn" phx-click="set-story-assign/:story_id/show/true">
        Open slideover
      </button>
      <.story/>
    </div>
    """
  end

  def stories do
    [
      %Story{
        id: :default_slideover,
        attributes: %{
          title: "I open on the left 👈",
          close_event: "set-story-assign/default_slideover/show/false"
        },
        slots: [
          "<:body>Hello world</:body>"
        ]
      },
      %Story{
        id: :right_slideover,
        attributes: %{
          title: "I open on the right 👉",
          close_event: "set-story-assign/right_slideover/show/false",
          position: :right
        },
        slots: [
          "<:body>Hello world</:body>"
        ]
      }
    ]
  end
end
