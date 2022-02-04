defmodule IdeePlaceWeb.IdeaLive.Show do
  use IdeePlaceWeb, :live_view

  alias IdeePlace.Ideas

  on_mount IdeePlaceWeb.UserLiveAuth

  def mount(_params, %{"idea_id" => idea_id} = _session, socket) do
    idea = Ideas.get_idea!(idea_id, preload: [:author, :topics])
    idea_is_starred = Ideas.idea_is_starred_by(idea.id, socket.assigns.current_user)

    {
      :ok,
      assign(
        socket,
        current_user: socket.assigns.current_user,
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

  # Helpers

  # NOTE: the use of the `registered_processors` option is a bit tricky
  def as_html!(markdown) do
    markdown
    |> Earmark.as_html!(
      smartypants: false,
      registered_processors: [
        Earmark.TagSpecificProcessors.new(
          {"a", &Earmark.AstTools.merge_atts_in_node(&1, target: "_blank")}
        )
      ]
    )
    |> raw()
  end
end
