defmodule PhxLiveStorybookSampleWeb.Router do
  use PhxLiveStorybookSampleWeb, :router

  import PhxLiveStorybook.Router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {PhxLiveStorybookSampleWeb.LayoutView, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  scope "/", PhxLiveStorybookSampleWeb do
    pipe_through(:browser)

    live("/", PageLive, :index)

    live_storybook "/storybook",
      otp_app: :phx_live_storybook_sample,
      backend_module: PhxLiveStorybookSampleWeb.Storybook
  end

end
