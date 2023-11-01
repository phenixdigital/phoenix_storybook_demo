defmodule Storybook.Components.Modal do
  use PhoenixStorybook.Story, :component

  def function, do: &PhoenixStorybookDemo.Components.Modal.modal/1

  def imports do
    [{PhoenixStorybookDemo.Components.Modal, show_modal: 0}]
  end

  def template do
    """
    <div>
      <button type="button" class="btn" phx-click={show_modal()}>
        Open modal
      </button>
      <.psb-variation/>
    </div>
    """
  end

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          title: "Payment succesful",
          icon: "fa fa-check"
        },
        slots: [
          "<:body>Thanks for your money!</:body>"
        ]
      },
      %Variation{
        id: :with_buttons,
        attributes: %{
          title: "Payment succesful",
          icon: "fa fa-check"
        },
        slots: [
          "<:body>Thanks for your money!</:body>",
          """
          <:button>
            <button type="button" class="btn">
              Cancel
            </button>
          </:button>
          """,
          """
          <:button>
            <button type="button" class="btn">
              OK
            </button>
          </:button>
          """
        ]
      }
    ]
  end
end
