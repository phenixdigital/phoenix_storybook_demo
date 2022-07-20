defmodule PhxLiveStorybookSampleWeb.Storybook do
  use PhxLiveStorybook.Storybook,
    components_path: Path.expand("./storybook", __DIR__),
    title: "My Storybook"
end
