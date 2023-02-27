defmodule Storybook.Examples.Forms do
  use PhoenixStorybook.Story, :example

  alias Storybook.Examples.FormHTML

  def doc, do: "This is a basic form example."

  def extra_sources do
    [
      "./form_example.html.heex",
      "./form_html.ex"
    ]
  end

  @impl true
  def mount(_params, session, socket) do
    {:ok, assign(socket, value: 1, theme: session["theme"])}
  end

  @impl true
  def render(assigns) do
    FormHTML.form_example(assigns)
  end

  @impl true
  def handle_event("click", _, socket) do
    {:noreply, update(socket, :value, &(&1 + 1))}
  end
end
