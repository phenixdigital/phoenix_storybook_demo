defmodule Storybook.Components.Modal do
  use PhoenixStorybook.Story, :component

  def function, do: &PhoenixStorybookSample.Components.Modal.modal/1

  def imports do
    [{PhoenixStorybookSample.Components.Modal, show_modal: 0}]
  end

  def template do
    """
    <div lsb-code-hidden >
      <button type="button" class="btn" phx-click={show_modal()}>
        Open modal :variation_id
      </button>
      <.lsb-variation/>
    </div>
    """
  end

  def variations do
    [
      %Variation{
        id: :help,
        attributes: %{
          title: "Help",
          icon: "fa fa-info-circle"
        },
        slots: [
          "<:body>
      <p>
      This storybook allows you to create new components within this application and/or add UI components to your own application
      </p>
      <p>
        Should you wish to add the UI components to your application, you can copy the sample code on the right.
      </p>
     </:body>"
        ]
      }
    ]
  end
end
