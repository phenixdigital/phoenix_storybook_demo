defmodule Storybook.Form do
  use PhoenixStorybook.Index

  def entry("text_input"), do: [icon: {:fa, "input-text", :thin}]
end
