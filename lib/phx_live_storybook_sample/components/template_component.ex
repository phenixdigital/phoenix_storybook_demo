defmodule PhxLiveStorybookSample.Components.TemplateComponent do
  use Phoenix.Component

  attr :label, :string, default: ""
  attr :status, :boolean, default: false

  def template_component(assigns) do
    ~H"""
    <span>label: <%= @label %> / status: <%= @status %></span>
    """
  end
end
