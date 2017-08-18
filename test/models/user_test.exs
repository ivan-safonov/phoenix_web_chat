defmodule Webchat.UserTest do
  use Webchat.ModelCase

  alias Webchat.User

  @valid_attrs %{password: "12345678Aa", username: "some"}
  @invalid_attrs %{password: "1", username: "popd j"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
