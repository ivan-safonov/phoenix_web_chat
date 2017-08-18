defmodule Webchat.RoomChannel do
  use Phoenix.Channel
  use Guardian.Channel

  alias Webchat.{Message, Repo, PageController}

  def join("rooms:lobby", _message, socket) do
    {:ok, socket}
  end

  def join(_room, _params, _socket) do
    {:error, %{reason: "you can only join the lobby"}}
  end

  def handle_in(event, params, socket) do
    changed_map = %{content: params["content"], user_id: params["user_id"]}
    changeset = Message.changeset(%Message{}, changed_map )
    case Repo.insert(changeset) do
      {:ok, message} ->
        user = Repo.get(Webchat.User, changed_map[:user_id])
        broadcast! socket, "new_msg", Map.merge(changed_map, %{username: user.username})
        {:reply, :ok, socket}
      {:error, _changeset} ->
        {:reply, :error, socket}
    end
  end

  #  defp message_params(params) do
  #    Map.merge(%{"content": paramstext}, %{"user_id": user})
  #  end
end