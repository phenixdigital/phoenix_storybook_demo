defmodule PhxLiveStorybookSample.Router do
  use PhxLiveStorybookSample, :router

  import PhxLiveStorybook.Router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {PhxLiveStorybookSample.LayoutView, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  scope "/" do
    storybook_assets()
  end

  scope "/", PhxLiveStorybookSample do
    pipe_through(:browser)
    get "/", RedirectController, :redirect_to_storybook
    live("/page", PageLive, :index)

    live_storybook("/storybook", backend_module: Storybook)
  end
end
