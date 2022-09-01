defmodule Storybook.Components.Modal do
  use PhxLiveStorybook.Entry, :component

  def function, do: &PhxLiveStorybookSampleWeb.Components.Modal.modal/1

  def template do
    """
    <div>
      <button type="button" class="btn" phx-click={Modal.show_modal()}>
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
        id: :buttons,
        doc: "Modal buttons, displayed in footer",
        type: :slot
      }
    ]
  end

  def stories do
    [
      %Story{
        id: :default_modal,
        attributes: %{
          title: "Payment succesful",
          icon: "fa fa-check"
        },
        slots: [
          "<:body>Thanks for your money!</:body>"
        ]
      }
    ]
  end
end
