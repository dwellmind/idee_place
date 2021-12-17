defmodule IdeePlaceWeb.IdeaIndexLive do
  use IdeePlaceWeb, :live_view

  alias IdeePlace.Ideas

  def mount(_params, %{"current_user" => current_user}, socket) do
    ideas = Ideas.list_ideas(preload: :author)
    starred_ideas_id = Ideas.list_starred_ideas_id_for(current_user)

    {
      :ok,
      assign(socket,
        current_user: current_user,
        ideas: ideas,
        starred_ideas_id: starred_ideas_id,
        query: ""
      )
    }
  end

  def handle_event("search", %{"search" => %{"query" => ""}}, socket) do
    ideas = Ideas.list_ideas(preload: :author)

    {:noreply, assign(socket, ideas: ideas)}
  end

  def handle_event("search", %{"search" => %{"query" => query}}, socket) do
    %{
      authors: authors,
      topics: topics,
      user_stars: user_stars,
      keywords: keywords
    } = Ideas.SearchParser.parse(query)

    ideas =
      Ideas.list_ideas(
        preload: :author,
        filters: [
          authors: authors,
          topics: topics,
          user_stars: user_stars,
          keywords: keywords
        ]
      )

    {:noreply, assign(socket, ideas: ideas, query: query)}
  end
end
