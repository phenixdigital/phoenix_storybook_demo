defmodule Storybook.Examples.FormHTML do
  use Phoenix.Component

  import PhxLiveStorybookSample.Components.Button
  import PhxLiveStorybookSample.Components.Form.TextInputGroup

  import Phoenix.Component

  embed_templates("./*")
end
