import Config

config :phoenix_storybook_demo, PhoenixStorybookDemo.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    view: PhoenixStorybookDemo.ErrorView,
    accepts: ~w(html json),
    layout: false
  ],
  pubsub_server: PhoenixStorybookDemo.PubSub,
  live_view: [signing_salt: "fYsrW27v"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js js/components.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "4.1.11",
  default: [
    args: ~w(
      --input=css/demo.css
      --output=../priv/static/assets/demo.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
