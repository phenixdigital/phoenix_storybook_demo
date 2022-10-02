defmodule Storybook.Styleguide do
  use PhxLiveStorybook.Index

  def folder_icon, do: {:fa, "notebook", :thin}

  def entry("colors"), do: [icon: {:fa, "swatchbook", :thin}]
  def entry("typography"), do: [icon: {:fa, "text-size", :duotone}]
end
