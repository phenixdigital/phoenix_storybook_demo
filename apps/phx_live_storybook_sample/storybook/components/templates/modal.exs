defmodule Storybook.Components.Modal do
  use PhxLiveStorybook.Entry, :component

  def function, do: &PhxLiveStorybookSampleWeb.Components.Modal.modal/1

  def icon, do: "fat fa-window-restore"

  def imports do
    [{PhxLiveStorybookSampleWeb.Components.Modal, show_modal: 0}]
  end

  def template do
    """
    <div>
      <button type="button" class="btn" phx-click={show_modal()}>
        Open modal
      </button>
      <.story/>
    </div>
    """
  end

  def attributes do
    [
      %Attr{
        id: :title,
        doc: "Modal title",
        type: :string,
        required: true
      },
      %Attr{
        id: :icon,
        doc: "Modal icon. FontAwesome classes",
        type: :string
      },
      %Attr{
        id: :body,
        doc: "Modal content",
        type: :slot,
        required: true
      },
      %Attr{
        id: :button,
        doc: "Modal buttons, displayed in footer",
        type: :slot
      }
    ]
  end

  def stories do
    [
      %Story{
        id: :default,
        attributes: %{
          title: "Payment succesful",
          icon: "fa fa-check"
        },
        slots: [
          "<:body>Thanks for your money!</:body>"
        ]
      },
      %Story{
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
