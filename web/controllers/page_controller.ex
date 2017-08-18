defmodule Webchat.PageController do
  use Webchat.Web, :controller
  alias Webchat.Repo

  plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__

  def unauthenticated(conn, params) do
    conn
    |> redirect(to: "/register")
  end

  def index(conn, _params) do
    current_user = Guardian.Plug.current_resource(conn)
    render conn, "index.html", current_user: current_user
  end
end
