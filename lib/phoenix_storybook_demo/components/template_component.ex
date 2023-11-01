defmodule PhoenixStorybookDemo.Components.TemplateComponent do
  use Phoenix.Component

  attr :label, :string, default: ""
  attr :status, :boolean, default: false

  @doc """
  Technical component illustrating how templates and assign/toggle can be used together.
  """
  def template_component(assigns) do
    ~H"""
    <span>label: <%= @label %> / status: <%= @status %></span>
    """
  end
end
