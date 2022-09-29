defmodule Storybook.Templates do
  use PhxLiveStorybook.Index

  def entry("modal"), do: [icon: {:fa, "window-restore", :thin}]
  def entry("slideover"), do: [name: "Slide-over", icon: {:fa, "sidebar", :thin}]
  def entry("template_component"), do: [name: "Set assigns", icon: {:fa, "code", :thin}]
end
