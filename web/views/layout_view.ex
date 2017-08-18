defmodule Webchat.LayoutView do
  use Webchat.Web, :view

  def user_signed_in?(conn) do
    !!conn.assigns[:current_user]
  end
end
