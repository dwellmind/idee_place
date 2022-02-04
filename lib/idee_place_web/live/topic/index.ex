defmodule IdeePlaceWeb.TopicLive.Index do
  use IdeePlaceWeb, :live_view

  alias IdeePlace.Ideas

  on_mount IdeePlaceWeb.UserLiveAuth

  def mount(_params, %{"query" => query}, socket) do
    topics_page = Ideas.list_topics(page_number: 1)
    starred_topics_id = Ideas.list_starred_topics_id_for(socket.assigns.current_user)

    {
      :ok,
      assign(socket, [
        current_user: socket.assigns.current_user,
        topics_page: topics_page,
        starred_topics_id: starred_topics_id,
        query: query
      ])
    }
  end

  def mount(params, _session, socket) do
    mount(params, %{"query" => ""}, socket)
  end

  def handle_event("search", %{"search" => %{"query" => query}}, socket) do
    topics_page = get_topics_page(query, 1)
    starred_topics_id = Ideas.list_starred_topics_id_for(socket.assigns.current_user)

    {
      :noreply,
      assign(socket, [
        topics_page: topics_page,
        starred_topics_id: starred_topics_id,
        query: query
      ])
    }
  end

  def handle_event("previous_page", %{"query" => query}, socket) do
    previous_page_number = socket.assigns.topics_page.page_number - 1

    if previous_page_number < 1 do
      raise "No more previous page, already on the first one."
    end

    topics_page = get_topics_page(query, previous_page_number)
    starred_topics_id = Ideas.list_starred_topics_id_for(socket.assigns.current_user)

    {
      :noreply,
      assign(socket, [
        topics_page: topics_page,
        starred_topics_id: starred_topics_id,
        query: query
      ])
    }
  end

  def handle_event("next_page", %{"query" => query}, socket) do
    next_page_number = socket.assigns.ideas_page.page_number + 1

    if next_page_number > socket.assigns.topics_page.total_pages do
      raise "No more next page, last page is #{socket.assigns.topics_page.total_pages}."
    end

    topics_page = get_topics_page(query, next_page_number)
    starred_topics_id = Ideas.list_starred_topics_id_for(socket.assigns.current_user)

    {
      :noreply,
      assign(socket, [
        topics_page: topics_page,
        starred_topics_id: starred_topics_id,
        query: query
      ])
    }
  end

  def handle_event("go_to_page", %{"page" => page_number_string, "query" => query}, socket) do
    page_number = String.to_integer(page_number_string)

    if page_number < 1 or page_number > socket.assigns.ideas_page.total_pages do
      raise "Page not in range (1..#{socket.assigns.topics_page.total_pages})."
    end

    topics_page = get_topics_page(query, page_number)
    starred_topics_id = Ideas.list_starred_topics_id_for(socket.assigns.current_user)

    {
      :noreply,
      assign(socket, [
        topics_page: topics_page,
        starred_topics_id: starred_topics_id,
        query: query
      ])
    }
  end

  defp get_topics_page(query, page_number) do
    Ideas.list_topics(
      page_number: page_number,
      filters: [
        keywords: query
      ]
    )
  end
end
