defmodule Webchat.Message do
  use Webchat.Web, :model

  schema "messages" do
    field :content, :string
    belongs_to :user, Webchat.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
