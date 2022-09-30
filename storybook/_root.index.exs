defmodule Storybook.Root do
  use PhxLiveStorybook.Index
  def folder_icon, do: {:fa, "book-open", :light, "lsb-mr-1"}
  def folder_name, do: "Storybook"

  def entry("colors"), do: [icon: {:fa, "swatchbook", :thin}]
  def entry("typography"), do: [icon: {:fa, "text-size", :duotone}]
end
