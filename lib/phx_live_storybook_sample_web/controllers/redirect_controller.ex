defmodule PhxLiveStorybookSampleWeb.RedirectController do
  use PhxLiveStorybookSampleWeb, :controller

  def redirect_to_storybook(conn, _) do
    redirect(conn, to: "/storybook")
  end
end
