defmodule ChatWeb.MessageControllerTest do
  use ChatWeb.ConnCase

  test "POST /send", %{conn: conn} do
    conn = post(conn, "/send", ["name": "General Kenobi", "message": "Hello there!"])
    assert conn.resp_body =~ "Hello there! General Kenobi"
  end
end
