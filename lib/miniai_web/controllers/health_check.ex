defmodule MiniaiWeb.HealthCheckController do
  use MiniaiWeb, :controller

  def ping(conn, _params) do
    conn
    |> send_resp(200, "pong")
  end
end
