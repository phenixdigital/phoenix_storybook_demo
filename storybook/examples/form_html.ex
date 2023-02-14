defmodule Storybook.Examples.FormHTML do
  use Phoenix.Component

  import PhoenixStorybookSample.Components.Button
  import PhoenixStorybookSample.Components.Form.TextInputGroup

  import Phoenix.Component

  embed_templates("./*")
end
