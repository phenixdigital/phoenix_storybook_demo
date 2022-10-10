defmodule Storybook do
  use PhxLiveStorybook,
    otp_app: :phx_live_storybook_sample,
    content_path: Path.expand("../storybook/", __DIR__),
    css_path: "/assets/app.css",
    js_path: "/assets/components.js",
    sandbox_class: "storybook-sample-sandbox",
    themes: [
      default: [name: "Default"],
      colorful: [name: "Colorful", dropdown_class: "lsb-text-pink-600"]
    ],
    font_awesome_plan: :pro,
    font_awesome_kit_id: "7a72374eed",
    compilation_mode: :eager
end
