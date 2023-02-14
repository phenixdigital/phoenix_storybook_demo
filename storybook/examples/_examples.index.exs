defmodule Storybook.Examples do
  use PhoenixStorybook.Index

  def folder_icon, do: {:fa, "lightbulb", :thin}

  def entry("form"), do: [icon: {:fa, "rectangle-list", :thin}]
end
