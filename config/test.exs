import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_storybook_demo, PhoenixStorybookDemo.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "uLrRJONmb0hneSd8mF7sOXx29gqH0RnL89gEQVsXwOs2ePlHtXEjsws7Z3ITeDGg",
  server: false

# In test we don't send emails.
config :phoenix_storybook_demo, PhoenixStorybookDemo.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
