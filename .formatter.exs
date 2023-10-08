[
  import_deps: [:phoenix, :phoenix_storybook],
  plugins: [Phoenix.LiveView.HTMLFormatter],
  inputs: [
    "*.{ex,exs}",
    "config/**/*.{ex,exs}",
    "storybook/**/*.{ex,exs}",
    "lib/**/*.{ex,exs}",
    "test/**/*.{ex,exs}"
  ]
]
