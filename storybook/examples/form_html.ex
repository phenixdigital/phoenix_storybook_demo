defmodule Storybook.Examples.FormHTML do
  use Phoenix.Component

  import PhoenixStorybookDemo.Components.Button
  import PhoenixStorybookDemo.Components.Form.TextInputGroup

  import Phoenix.Component

  embed_templates("./*")
end
