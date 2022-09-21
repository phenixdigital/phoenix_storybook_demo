defmodule Storybook.Components.Slideover do
  use PhxLiveStorybook.Story, :component
  alias Phoenix.LiveView.JS

  def function, do: &PhxLiveStorybookSample.Components.Slideover.slideover/1
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
        values: [:left, :right],
        default: :left
      },
      %Attr{
        id: :close_event,
        doc:
          "Event that will be triggered when clicking the close button or outside of the slide-over",
        type: JS
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
    <div lsb-code-hidden>
      <button type="button" class="btn" phx-click={JS.push("assign", value: %{show: true})}>
        Open :variation_id
      </button>
      <.lsb-variation/>
    </div>
    """
  end

  def variations do
    [
      %Variation{
        id: :default_slideover,
        attributes: %{
          title: "I open on the left 👈",
          close_event: JS.push("assign", value: %{variation_id: :default_slideover, show: false})
        },
        slots: [
          "<:body>Hello world</:body>"
        ]
      },
      %Variation{
        id: :right_slideover,
        attributes: %{
          title: "I open on the right 👉",
          close_event: JS.push("assign", value: %{variation_id: :right_slideover, show: false}),
          position: :right
        },
        slots: [
          "<:body>Hello world</:body>"
        ]
      },
      %VariationGroup{
        id: :group,
        variations: [
          %Variation{
            id: :left_slideover,
            attributes: %{
              title: "I open on the left 👈",
              close_event: JS.push("assign", value: %{variation_id: [:group, :left_slideover], show: false}),
              show: false
            },
            slots: [
              "<:body>Left slide-over</:body>"
            ]
          },
          %Variation{
            id: :right_slideover,
            attributes: %{
              title: "I open on the right 👉",
              close_event: JS.push("assign", value: %{variation_id: [:group, :right_slideover], show: false}),
              position: :right,
              show: false
            },
            slots: [
              "<:body>Right slide-over</:body>"
            ]
          }
        ]
      }
    ]
  end
end