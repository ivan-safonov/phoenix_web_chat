defmodule Webchat.PageView do
  use Webchat.Web, :view

  alias Webchat.{User, Message, Repo}
  import Ecto.Query, only: [from: 2]

  def logged_in_user(conn) do
    user = Guardian.Plug.current_resource(conn)
  end

  def get_messages(conn) do
    query = from m in Message,
                 join: u in User, on: m.user_id == u.id,
                 order_by: [asc: :inserted_at],
                 select: {u.username, m.content, m.inserted_at}

    Repo.all(query)
  end
end
