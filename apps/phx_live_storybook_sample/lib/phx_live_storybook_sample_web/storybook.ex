defmodule PhxLiveStorybookSampleWeb.Storybook do

  use PhxLiveStorybook,
    components_path: Path.expand("./storybook", __DIR__),
    components_module_prefix: PhxLiveStorybookSampleWeb.Storybook,
    title: "My Storybook",
    css_path: "/assets/app.css",
    js_path: "/assets/components.js",
    makeup_style: StyleMap.tango_style()
end
