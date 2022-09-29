defmodule Storybook.Buttons do
  use PhxLiveStorybook.Index

  def entry("button"), do: [icon: {:fa, "rectangle-ad", :thin}]
  def entry("button_iframe"), do: [icon: {:fa, "rectangle-ad", :thin}]
  def entry("dropdown"), do: [icon: {:fa, "list-dropdown", :thin}]
end
