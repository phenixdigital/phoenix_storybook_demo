defmodule PhoenixStorybookDemo.RedirectController do
  use PhoenixStorybookDemo, :controller

  def redirect_to_storybook(conn, _) do
    redirect(conn, to: "/storybook")
  end
end
