defmodule Storybook.BlockAndSlots do
  use PhoenixStorybook.Index

  def entry("list"), do: [icon: {:fa, "list", :thin}]
  def entry("table"), do: [icon: {:fa, "table", :thin}]
end
