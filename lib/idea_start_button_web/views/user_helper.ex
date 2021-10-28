defmodule IdeaStartButtonWeb.UserHelpers do
  @moduledoc """
  Conveniences for user checks.
  """

  alias IdeaStartButton.Accounts

  def is_user_logged_in(conn) do
    conn.assigns[:current_user] != nil
  end

  def is_current_user(_conn, nil) do
    false
  end

  def is_current_user(conn, %Accounts.User{} = user) do
    is_current_user(conn, user.id)
  end

  def is_current_user(conn, id) when is_integer(id) do
    current_user = conn.assigns[:current_user]
    current_user && current_user.id == id
  end
end
