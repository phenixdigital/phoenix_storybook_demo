defmodule PhxLiveStorybookSampleWeb.PageLive do
  use PhxLiveStorybookSampleWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <section class="row space-y-4">
      <.badge label="I'm a badge" text-color="text-blue-600" bg-color="bg-blue-100"/>
      <.button label="I'm a button"/>
      <.dropdown label="I'm a dropdown" id="dropdown">
        <:entry path="#" label="Account settings"/>
        <:entry path="#" label="Support"/>
        <:entry path="#" label="License"/>
      </.dropdown>
    </section>
    """
  end
end
