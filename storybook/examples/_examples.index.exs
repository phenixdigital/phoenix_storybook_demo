defmodule Storybook.Examples do
  use PhoenixStorybook.Index

  def folder_icon, do: {:fa, "lightbulb", :thin}

  def entry("forms"), do: [icon: {:fa, "rectangle-list", :thin}]
  def entry("core_components"), do: [name: "Core components", icon: {:fa, "box-open", :thin}]
end
