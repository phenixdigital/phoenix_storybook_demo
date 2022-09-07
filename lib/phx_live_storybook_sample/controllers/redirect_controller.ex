defmodule PhxLiveStorybookSample.RedirectController do
  use PhxLiveStorybookSample, :controller

  def redirect_to_storybook(conn, _) do
    redirect(conn, to: "/storybook")
  end
end
