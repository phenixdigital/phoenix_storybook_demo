defmodule PhxLiveStorybookSampleUmbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: [],
      aliases: aliases()
    ]
  end

  defp aliases do
    [
      "storybook.assets.watch": "cmd npm run watch --prefix assets"
    ]
  end
end
