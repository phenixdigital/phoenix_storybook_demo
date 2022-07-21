defmodule PhxLiveStorybookSample.Repo do
  use Ecto.Repo,
    otp_app: :phx_live_storybook_sample,
    adapter: Ecto.Adapters.Postgres
end
