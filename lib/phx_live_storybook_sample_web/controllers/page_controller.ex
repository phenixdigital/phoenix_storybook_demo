defmodule PhxLiveStorybookSampleWeb.PageController do
  use PhxLiveStorybookSampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
