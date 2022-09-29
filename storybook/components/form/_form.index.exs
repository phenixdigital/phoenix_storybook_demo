defmodule Storybook.Form do
  use PhxLiveStorybook.Index

  def entry("text_input"), do: [icon: {:fa, "input-text", :thin}]
end
