defmodule Webchat.RegistrationController do
  use Webchat.Web, :controller
  alias Webchat.User

  def new(conn, _) do
    render conn, :new
  end

  def create(conn, %{"register" => register_params}) do
    user = Webchat.User.changeset(%User{}, register_params)
    case Webchat.Repo.insert(user) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Username should not contain white spaces")
        |> render :new
    end
  end

end