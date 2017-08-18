defmodule Webchat.Message do
  use Webchat.Web, :model

  schema "messages" do
    field :content, :string
    belongs_to :user, Webchat.User

    timestamps()
  end

  @required_fields ~w(content user_id)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params,  @required_fields, @optional_fields )
    |> validate_required([])
  end
end
