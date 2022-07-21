defmodule PhxLiveStorybookSampleWeb.Storybook do

  use PhxLiveStorybook.Storybook,
    components_path: Path.expand("./storybook", __DIR__),
    components_module_prefix: PhxLiveStorybookSampleWeb.Storybook,
    css_path: "/assets/app.css",
    js_path: "/assets/components.js",
    title: "My Storybook"
end
