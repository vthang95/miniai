defmodule MiniaiWeb.HealthCheckTest do
  use MiniaiWeb.ConnCase, async: true

  test "ping pong", %{conn: conn} do
    conn = get(conn, ~p"/api/ping")
    assert response(conn, 200) =~ "pong"
  end
end
