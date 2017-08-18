defmodule Webchat.SessionController do
  use Webchat.Web, :controller

  def new(conn, _) do
    render conn, :new
  end

  def create(conn, %{"session" => %{"username" => username, "password" => password}}) do
    {valid, user} = Webchat.User.valid_authentication?(username, password)
    if valid do
      conn
      |> Guardian.Plug.sign_in(user)
      |> redirect(to: "/")
    else
      conn
      |> put_flash(:error, "Incorrect password or username")
      |> render :new
    end
  end
end