defmodule PhoenixStorybookSample.MixProject do
  use Mix.Project

  def project do
    [
      app: :phoenix_storybook_sample,
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(Mix.env()),
      build_path: "_build",
      config_path: "config/config.exs",
      deps_path: "deps",
      lockfile: ".mix.lock",
      releases: [
        phoenix_storybook_sample: [
          strip_beams: [
            keep: ["Docs"]
          ]
        ]
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {PhoenixStorybookSample.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "storybook", "test/support"]
  defp elixirc_paths(_), do: ["lib", "storybook"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps(env) do
    [
      {:phoenix, "~> 1.7.0"},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.20.0"},
      {:phoenix_view, "~> 2.0", override: true},
      {:floki, ">= 0.30.0", only: :test},
      {:esbuild, "~> 0.4", runtime: env == :dev},
      {:tailwind, "~> 0.1", runtime: env == :dev},
      {:gettext, "~> 0.18"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.5"},
      {:phx_component_helpers, "~> 1.3.0"},
      # {:phoenix_storybook, "~> 0.5.7"}
      {:phoenix_storybook, path: "../phoenix_storybook"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get"],
      test: ["test"],
      "assets.deploy": [
        "tailwind default --minify",
        "esbuild default --minify",
        "phx.digest"
      ]
    ]
  end
end
