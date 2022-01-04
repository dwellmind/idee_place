defmodule IdeePlaceWeb.IdeaIndexLive do
  use IdeePlaceWeb, :live_view

  alias IdeePlace.Ideas

  def mount(_params, %{"current_user" => current_user, "query" => query}, socket) do
    ideas_page = Ideas.list_ideas(preload: :author, page_number: 1)
    starred_ideas_id = Ideas.list_starred_ideas_id_for(current_user)

    {
      :ok,
      assign(socket, [
        current_user: current_user,
        ideas_page: ideas_page,
        starred_ideas_id: starred_ideas_id,
        query: query
      ])
    }
  end

  def mount(params, %{"current_user" => current_user}, socket) do
    mount(params, %{"current_user" => current_user, "query" => ""}, socket)
  end

  def handle_event("search", %{"search" => %{"query" => query}}, socket) do
    ideas_page = get_ideas_page(query, 1)
    starred_ideas_id = Ideas.list_starred_ideas_id_for(socket.assigns.current_user)

    {
      :noreply,
      assign(socket, [
        ideas_page: ideas_page,
        starred_ideas_id: starred_ideas_id,
        query: query
      ])
    }
  end

  def handle_event("previous_page", %{"query" => query}, socket) do
    previous_page_number = socket.assigns.ideas_page.page_number - 1

    if previous_page_number < 1 do
      raise "No more previous page, already on the first one."
    end

    ideas_page = get_ideas_page(query, previous_page_number)
    starred_ideas_id = Ideas.list_starred_ideas_id_for(socket.assigns.current_user)

    {
      :noreply,
      assign(socket, [
        ideas_page: ideas_page,
        starred_ideas_id: starred_ideas_id,
        query: query
      ])
    }
  end

  def handle_event("next_page", %{"query" => query}, socket) do
    next_page_number = socket.assigns.ideas_page.page_number + 1

    if next_page_number > socket.assigns.ideas_page.total_pages do
      raise "No more next page, last page is #{socket.assigns.ideas_page.total_pages}."
    end

    ideas_page = get_ideas_page(query, next_page_number)
    starred_ideas_id = Ideas.list_starred_ideas_id_for(socket.assigns.current_user)

    {
      :noreply,
      assign(socket, [
        ideas_page: ideas_page,
        starred_ideas_id: starred_ideas_id,
        query: query
      ])
    }
  end

  def handle_event("go_to_page", %{"page" => page_number_string, "query" => query}, socket) do
    page_number = String.to_integer(page_number_string)

    if page_number < 1 or page_number > socket.assigns.ideas_page.total_pages do
      raise "Page not in range (1..#{socket.assigns.ideas_page.total_pages})."
    end

    ideas_page = get_ideas_page(query, page_number)
    starred_ideas_id = Ideas.list_starred_ideas_id_for(socket.assigns.current_user)

    {
      :noreply,
      assign(socket, [
        ideas_page: ideas_page,
        starred_ideas_id: starred_ideas_id,
        query: query
      ])
    }
  end

  defp get_ideas_page(query, page_number) do
    %{
      authors: authors,
      topics: topics,
      user_stars: user_stars,
      keywords: keywords
    } = Ideas.SearchParser.parse(query)

    Ideas.list_ideas(
      page_number: page_number,
      preload: :author,
      filters: [
        authors: authors,
        topics: topics,
        user_stars: user_stars,
        keywords: keywords
      ]
    )
  end
end
