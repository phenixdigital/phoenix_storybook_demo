defmodule Storybook.Components.Modal do
  use PhxLiveStorybook.Entry, :component

  def function, do: &PhxLiveStorybookSampleWeb.Components.Modal.modal/1

  def template do
    """
    <div>
      <button phx-click={Modal.show_modal()}>Open modal</button>
      <.story/>
    </div>
    """
  end

  def stories do
    [
      %Story{
        id: :default_modal,
        slots: [
          "<:icon><i class='fa fa-check'></i></:icon>",
          "<:body>hello world</:body>"
        ]
      }
    ]
  end
end
