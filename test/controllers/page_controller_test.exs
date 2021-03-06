defmodule Webchat.PageControllerTest do
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
