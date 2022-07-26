defmodule PhxLiveStorybookSampleWeb.PageLive do
  use PhxLiveStorybookSampleWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-4xl mt-6">
      <h1 class="text-2xl text-indigo-600 mb-6 text-center uppercase font-bold">Live Storybook demo application</h1>
      <div class="my-6 mb-10 text-center text-lg p-2 rounded-md bg-indigo-600 hover:bg-indigo-800 text-white">
        <%= live_redirect to: "/storybook" do %>
          👉 Go to Storybook
        <% end %>
      </div>

      <h2 class="text-xl border-b border-gray-200 pt-10 pb-2 text-slate-700">These are application components rendered by the application itself.</h2>
      <section class="row space-y-4">
        <.badge label="I'm a badge" text-color="text-blue-600" bg-color="bg-blue-100"/>
        <.button label="I'm a button"/>
        <.dropdown label="I'm a dropdown" id="dropdown">
          <:entry path="#" label="Account settings"/>
          <:entry path="#" label="Support"/>
          <:entry path="#" label="License"/>
        </.dropdown>
        <.live_component module={LiveButton} label="I have state" id="live-button"/>
      </section>
    </div>
    """
  end
end
