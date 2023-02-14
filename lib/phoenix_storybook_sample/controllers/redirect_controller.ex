defmodule PhoenixStorybookSample.RedirectController do
  use PhoenixStorybookSample, :controller

  def redirect_to_storybook(conn, _) do
    redirect(conn, to: "/storybook")
  end
end
