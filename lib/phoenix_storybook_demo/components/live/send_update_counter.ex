defmodule PhoenixStorybookDemo.Components.Live.SendUpdateCounter do
  @moduledoc """
  A LiveComponent that expects its parent LiveView to send updates via `send_update/2`.
  """
  use PhoenixStorybookDemo, :live_component

  attr :label, :string, default: "Request increment", doc: "Button label"
  attr :count, :integer, doc: "Current count, set by parent via send_update"

  def render(assigns) do
    ~H"""
    <div id={@id} class="space-y-2">
      <div class="text-sm text-slate-700">
        Count (from parent): <span class="font-semibold text-slate-900">{@count}</span>
      </div>
      <button
        type="button"
        class="inline-flex items-center px-3 py-1.5 rounded-md bg-slate-900 text-white text-sm hover:bg-slate-700"
        phx-click="request_increment"
        phx-target={@myself}
      >
        {@label}
      </button>
      <p class="text-xs text-slate-500 leading-snug">
        This component only changes when the parent LiveView handles
        <code class="px-1 py-0.5 bg-slate-100 rounded">{@id}</code>
        and calls <code class="px-1 py-0.5 bg-slate-100 rounded">send_update/2</code>.
      </p>
    </div>
    """
  end

  def update(assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:count, fn -> 0 end)}
  end

  def handle_event("request_increment", _params, socket) do
    next_count = socket.assigns.count + 1
    send(self(), {:send_update_demo, socket.assigns.id, next_count})
    {:noreply, socket}
  end
end
