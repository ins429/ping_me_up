defmodule PingMeUpWeb.PageController do
  use PingMeUpWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
