defmodule Webchat.MessageTest do
  use Webchat.ModelCase

  alias Webchat.Message

  @valid_attrs %{content: "hello world", user_id: "1"}
  @invalid_attrs %{content: "", user_id: ""}

  test "changeset with valid attributes" do
    changeset = Message.changeset(%Message{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Message.changeset(%Message{}, @invalid_attrs)
    refute changeset.valid?
  end
end
