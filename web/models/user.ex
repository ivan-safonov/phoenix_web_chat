defmodule Webchat.User do
  use Webchat.Web, :model

  alias Webchat.User
  alias Webchat.Repo

  schema "users" do
    field :username, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true
    has_many :messages, Webchat.Message

    timestamps()
  end

  @required_fields ~w(username password)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:username)
    |> validate_format(:username, ~r/\A[a-zA-Z0-9]+\Z/)
    |> encrypt_password
  end

  defp encrypt_password(changeset) do
    password = get_change(changeset, :password)
    encrypted_password = Comeonin.Bcrypt.hashpwsalt(password)
    put_change(changeset, :encrypted_password, encrypted_password)
  end

  def valid_authentication?(username, password) do
    case Repo.get_by(User, username: username) do
      nil ->
        {Comeonin.Bcrypt.dummy_checkpw(), nil}
      user ->
        {Comeonin.Bcrypt.checkpw(password, user.encrypted_password), user}
    end
  end
end
