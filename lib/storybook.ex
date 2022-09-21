defmodule Storybook do
  use PhxLiveStorybook,
    otp_app: :phx_live_storybook_sample,
    content_path: Path.expand("../storybook/", __DIR__),
    css_path: "/assets/app.css",
    js_path: "/assets/components.js",
    themes: [
      default: [name: "Default"],
      colorful: [name: "Colorful", dropdown_class: "text-pink-600"]
    ]
end