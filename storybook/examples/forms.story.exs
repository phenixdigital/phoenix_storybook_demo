defmodule Storybook.Examples.Forms do
  use PhoenixStorybook.Story, :example

  alias Storybook.Examples.FormHTML

  def doc,
    do: """
    This is a basic form example.
    """

  def extra_sources do
    [
      "./form_example.html.heex",
      "./form_html.ex"
    ]
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, value: 1, form: to_form(%{}))}
  end

  @impl true
  def render(assigns) do
    FormHTML.form_example(assigns)
  end

  @impl true
  def handle_event("inc", _, socket = %{assigns: %{value: v}}) do
    {:noreply, assign(socket, value: v + 1)}
  end
end
