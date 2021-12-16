defmodule IdeePlaceWeb.IdeaShowLive do
  use IdeePlaceWeb, :live_view

  alias IdeePlace.Ideas

  def mount(_params, %{"current_user" => current_user, "idea_id" => idea_id} = _session, socket) do
    idea = Ideas.get_idea!(idea_id, preload: [:author, :topics])
    idea_is_starred = Ideas.idea_is_starred_by(idea.id, current_user)

    {
      :ok,
      assign(
        socket,
        current_user: current_user,
        idea: idea,
        idea_is_starred: idea_is_starred
      )
    }
  end

  def handle_event("star_idea", _value, socket) do
    {:ok, _} = Ideas.star_idea_for(socket.assigns.idea, socket.assigns.current_user)

    {:noreply, assign(socket, idea_is_starred: true)}
  end

  def handle_event("unstar_idea", _value, socket) do
    {:ok, _} = Ideas.unstar_idea_for(socket.assigns.idea, socket.assigns.current_user)

    {:noreply, assign(socket, idea_is_starred: false)}
  end
end
