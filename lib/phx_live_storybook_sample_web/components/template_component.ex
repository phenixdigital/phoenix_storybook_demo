defmodule PhxLiveStorybookSampleWeb.Components.TemplateComponent do
  use Phoenix.Component

  def template_component(assigns) do
    assigns =
      assigns
      |> assign_new(:label, fn -> "" end)
      |> assign_new(:status, fn -> false end)

    ~H"""
    <span>label: <%= @label %> / status: <%= @status %></span>
    """
  end
end
