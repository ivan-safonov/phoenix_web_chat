{:ok, _, socket} =
  socket("user:id", %{some_assigns: 1})
  |> subscribe_and_join(RoomChannel, "room:lobby", %{"id" => 3})

defmodule Webchat.RoomChannel do
  use Webchat.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 302)
  end

  test "GET /register", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 302)
  end

  test "GET /session/new", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 302)
  end
end