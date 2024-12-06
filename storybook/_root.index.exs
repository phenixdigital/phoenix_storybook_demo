defmodule Storybook.Root do
  use PhoenixStorybook.Index
  def folder_icon, do: {:local, "hero-book-open-micro", "psb-mr-1"}
  def folder_name, do: "Storybook"

  def entry("welcome"), do: [name: "Welcome Page", icon: {:fa, "hand-wave", :thin}]
end
