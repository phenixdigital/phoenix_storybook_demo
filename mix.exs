defmodule PhxLiveStorybookSampleUmbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: [],
      apps: apps(Mix.env()),
      releases: [
        phx_live_storybook_sample: [
          applications: [phx_live_storybook_sample: :permanent]
        ]
      ]
    ]
  end

  defp apps(:prod), do: [:phx_live_storybook_sample]
  defp apps(_), do: [:phx_live_storybook_sample, :phx_live_storybook]
end
