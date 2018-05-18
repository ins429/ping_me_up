defmodule PingMeUpWeb.PingController do
  use PingMeUpWeb, :controller

  def index(conn, _params) do
    json conn, %{
      "ping" => "pong"
    }
  end
end
