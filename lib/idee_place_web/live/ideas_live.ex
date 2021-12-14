defmodule IdeePlaceWeb.IdeasLive do
  use IdeePlaceWeb, :live_view

  alias IdeePlace.Accounts
  alias IdeePlace.Ideas

  def mount(_params, session, socket) do
    socket = assign_defaults(session, socket)

    ideas = Ideas.list_ideas(preload: :author)

    starred_ideas_id =
      if socket.assigns.current_user do
        Ideas.list_starred_ideas_id_for(socket.assigns.current_user)
      else
        nil
      end

    {:ok, assign(socket, ideas: ideas, starred_ideas_id: starred_ideas_id, query: "")}
  end

  def handle_event("search", %{"search" => %{"query" => ""}}, socket) do
    ideas = Ideas.list_ideas(preload: :author)

    {:noreply, assign(socket, ideas: ideas, query: "")}
  end

  def handle_event("search", %{"search" => %{"query" => query}}, socket) do
    %{keywords: keywords, authors: authors} = Ideas.SearchParser.parse(query)

    ideas =
      Ideas.list_ideas(
        preload: :author,
        filters: [
          keywords: keywords,
          authors: authors
        ]
      )

    {:noreply, assign(socket, ideas: ideas, query: query)}
  end

  # Solution found here: https://stackoverflow.com/questions/66217782/elixir-phoenix-liveview-passing-user-id-through-socket
  # TODO: makes it a hook https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#on_mount/1
  defp assign_defaults(session, socket) do
    socket
    |> assign_new(:current_user, fn -> find_current_user(session) end)
  end

  defp find_current_user(session) do
    with user_token when not is_nil(user_token) <- session["user_token"],
         %Accounts.User{} = user <- Accounts.get_user_by_session_token(user_token),
         do: user
  end
end
