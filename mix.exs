defmodule PhxLiveStorybookSampleUmbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: [],
      apps: [:phx_live_storybook_sample],
      releases: [
        phx_live_storybook_sample: [
          applications: [phx_live_storybook_sample: :permanent]
        ]
      ]
    ]
  end
end
