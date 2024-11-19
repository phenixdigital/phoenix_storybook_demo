defmodule Storybook do
  use PhoenixStorybook,
    otp_app: :phoenix_storybook_demo,
    content_path: Path.expand("../storybook/", __DIR__),
    css_path: "/assets/app.css",
    js_path: "/assets/components.js",
    sandbox_class: "storybook-demo-sandbox",
    themes: [
      default: [name: "Default"],
      colorful: [name: "Colorful", dropdown_class: "psb-text-pink-600"]
    ],
    themes_strategies: [
      body_class: "theme",
      assign: "theme"
    ],
    color_mode: true,
    font_awesome_plan: :pro,
    font_awesome_kit_id: "7a72374eed",
    compilation_mode: :eager
end
