defmodule PhxLiveStorybookSample.Components.Form.TextInput do
  use PhxLiveStorybookSample, :component
  import PhxComponentHelpers

  import PhxLiveStorybookSample.Components.Form.{InputAddon, InputIcon}

  @base_class "block w-full focus:outline-none"
  @default_class "#{@base_class} border px-2 py-1 focus:ring-2 focus:ring-offset-2"
  @default_class_with_addon "#{@base_class} border-0 pl-2.5 focus:ring-0 "
  @default_class_with_icon "#{@base_class} border pl-10 focus:ring-2 focus:ring-offset-2"
  @default_class_disabled "#{@base_class} border pl-2.5 bg-default-bg-disabled text-default-txt-informative cursor-not-allowed focus:ring-2 focus:ring-offset-2"
  @default_class_disabled_with_icon "#{@base_class} border pl-10 bg-default-bg-disabled text-default-txt-informative cursor-not-allowed focus:ring-2 focus:ring-offset-2"
  @default_class_with_addon_disabled "#{@base_class} border pl-2.5 bg-default-bg-disabled text-default-txt-informative cursor-not-allowed focus:ring-0"

  @no_error_class "form-input"
  @error_class "form-input-error"

  def text_input(assigns) do
    assigns
    |> extend_class(&default_class/1, prefix_replace: false)
    |> set_phx_attributes()
    |> set_form_attributes()
    |> set_attributes(
      [
        :name,
        :value,
        :id,
        :placeholder,
        :disabled,
        type: "text"
      ],
      required: [:name]
    )
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <%= cond do %>
      <% assigns[:addon] -> %>
        <.input_addon {forward_assigns(assigns, prefix: :addon, take: [:theme, :form, :field])}>
          <%= render_input(assigns) %>
        </.input_addon>
      <% assigns[:icon] -> %>
        <.input_icon {forward_assigns(assigns, prefix: :icon, take: [:theme])}>
          <%= render_input(assigns) %>
        </.input_icon>
      <% assigns[:textarea] -> %>
        <%= render_text_area_input(assigns) %>
      <% true -> %>
        <%= render_input(assigns) %>
    <% end %>
    """
  end

  defp render_input(assigns) do
    ~H"""
    <input
      {@heex_disabled}
      {@heex_id}
      {@heex_name}
      {@heex_value}
      {@heex_phx_attributes}
      {@heex_class}
      {@heex_placeholder}
    />
    """
  end

  defp render_text_area_input(assigns) do
    ~H"""
    <textarea
      {@heex_disabled}
      {@heex_id}
      {@heex_type}
      {@heex_name}
      {@heex_phx_attributes}
      {@heex_class}
      {@heex_placeholder}
    >
      <%= @value %>
    </textarea>
    """
  end

  defp default_class(assigns) do
    class = "h-10 text-sm"

    class =
      cond do
        assigns[:addon] ->
          addon_class(assigns, class)

        assigns[:disabled] && assigns[:icon] ->
          "#{class} #{@default_class_disabled_with_icon} rounded-md"

        assigns[:disabled] ->
          "#{class} #{@default_class_disabled} rounded-md"

        assigns[:icon] ->
          "#{class} #{@default_class_with_icon} rounded-md"

        true ->
          "#{class} #{@default_class} rounded-md"
      end

    if has_errors?(assigns), do: "#{class} #{@error_class}", else: "#{class} #{@no_error_class}"
  end

  defp addon_class(assigns, class) do
    if assigns[:disabled] do
      "#{class} #{@default_class_with_addon_disabled} rounded-r-md"
    else
      "#{class} #{@default_class_with_addon} rounded-r-md"
    end
  end
end
