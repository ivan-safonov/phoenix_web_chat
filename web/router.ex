defmodule Webchat.Router do
  use Webchat.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
    plug Webchat.LoadCurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Webchat do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create

    resources "/session", SessionController, only: [:new, :create, :destroy]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Webchat do
  #   pipe_through :api
  # end
end
