defmodule Storybook.Components do
  use PhxLiveStorybook.Index

  def folder_icon, do: "far fa-toolbox"
  def folder_open?, do: true

  def entry("badge"), do: [icon: "fat fa-badge-check"]
end
