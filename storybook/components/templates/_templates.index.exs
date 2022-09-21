defmodule Storybook.Templates do
  use PhxLiveStorybook.Index

  def entry("modal"), do: [icon: "fat fa-window-restore"]
  def entry("slideover"), do: [name: "Slide-over", icon: "fat fa-sidebar"]
  def entry("template_component"), do: [name: "Set assigns", icon: "fat fa-code"]
end
