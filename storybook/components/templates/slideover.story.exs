defmodule Storybook.Components.Slideover do
  use PhoenixStorybook.Story, :component

  def function, do: &PhoenixStorybookSample.Components.Slideover.slideover/1

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
          close_event:
            {:eval,
             ~s|JS.push("assign", value: %{variation_id: :default_slideover, show: false})|}
        },
        slots: [
          "<:body>Hello beautiful people of Tauspace!</:body>"
        ]
      },
      %Variation{
        id: :right_slideover,
        attributes: %{
          title: "I open on the right 👉",
          close_event:
            {:eval, ~s|JS.push("assign", value: %{variation_id: :right_slideover, show: false})|},
          position: :right
        },
        slots: [
          "<:body>Hello beautiful people of Tauspace!</:body>"
        ]
      },
      %VariationGroup{
        id: :group,
        variations: [
          %Variation{
            id: :left_slideover,
            attributes: %{
              title: "I open on the left 👈",
              close_event:
                {:eval,
                 ~s|JS.push("assign", value: %{variation_id: [:group, :left_slideover], show: false})|},
              show: false
            },
            slots: [
              "<:body>Welcome to Tauspace :)</:body>"
            ]
          },
          %Variation{
            id: :right_slideover,
            attributes: %{
              title: "I open on the right 👉",
              close_event:
                {:eval,
                 ~s|JS.push("assign", value: %{variation_id: [:group, :right_slideover], show: false})|},
              position: :right,
              show: false
            },
            slots: [
              "<:body>Welcome to Tauspace :)</:body>"
            ]
          }
        ]
      }
    ]
  end
end
