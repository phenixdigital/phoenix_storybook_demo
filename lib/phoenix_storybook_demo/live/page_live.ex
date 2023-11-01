defmodule PhoenixStorybookDemo.PageLive do
  use PhoenixStorybookDemo, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-4xl mt-6">
      <h1 class="text-2xl text-indigo-600 mb-6 text-center uppercase font-bold">
        Live Storybook demo application
      </h1>
      <div class="my-6 mb-10 text-center text-lg p-2 rounded-md bg-indigo-600 hover:bg-indigo-800 text-white">
        <.link href="/storybook" class="text-inherit no-underline">
          👉 Go to Storybook
        </.link>
      </div>

      <h2 class="text-xl border-b border-gray-200 pt-10 pb-2 text-slate-700">
        These are application components rendered by the application itself.
      </h2>
      <section class="row space-y-4">
        <.badge text="I'm a badge" color={:primary} />
        <.button label="I'm a button" />
        <.dropdown text="I'm a dropdown" id="dropdown">
          <:entry path="#" text="Account settings" />
          <:entry path="#" text="Support" />
          <:entry path="#" text="License" />
        </.dropdown>
        <.live_component module={LiveButton} label="I have state" id="live-button" />
        <.list :let={entry} entries={~w(apple banana cherry)}>
          I like <%= entry %>
        </.list>
        <.table rows={[%{name: "Jean", city: "Paris"}, %{name: "Bob", city: "NY"}]}>
          <:col :let={row} label="Name">
            <%= row.name %>
          </:col>
          <:col :let={row} label="City">
            <%= row.city %>
          </:col>
        </.table>
      </section>
    </div>
    """
  end
end
