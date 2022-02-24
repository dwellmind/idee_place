defmodule IdeePlaceWeb.IdeaLive.Edit do
  use IdeePlaceWeb, :live_view

  alias IdeePlace.Repo
  alias IdeePlace.Ideas
  alias IdeePlace.Ideas.Idea

  import Ecto.Changeset

  on_mount IdeePlaceWeb.UserLiveAuth

  def mount(_params, %{"id" => id}, socket) do
    changeset =
      Ideas.get_idea!(id, preload: [:topics])
      |> Ideas.change_idea()

    {
      :ok,
      assign(
        socket,
        current_user: socket.assigns.current_user,
        changeset: changeset
      )
    }
  end

  def handle_info({:add_topic, topic_name}, socket) do
    if topic_name_already_exists?(socket, topic_name) do
      {:noreply, socket}
    else
      socket = add_topic(socket, topic_name)
      {:noreply, socket}
    end
  end

  def handle_info({:delete_topic, topic_name}, socket) do
    socket = remove_topic(socket, topic_name)
    {:noreply, socket}
  end

  def handle_info(:delete_last_topic, socket) do
    socket = remove_last_topic(socket)
    {:noreply, socket}
  end

  def handle_event("save", %{"idea" => idea_form} = _form, socket) do
    socket = set_title(socket, idea_form["title"])
    socket = set_description(socket, idea_form["description"])

    socket.assigns.changeset
    |> Idea.changeset()
    |> Repo.update!()

    {:noreply, socket}
  end

  # Helpers

  defp set_title(socket, title) do
    update_changeset(socket, %{title: title})
  end

  defp set_description(socket, description) do
    update_changeset(socket, %{description: description})
  end

  defp get_topics(socket) do
    fetch_field!(socket.assigns.changeset, :topics)
  end

  defp add_topic(socket, topic_name) do
    if topic_name_already_exists?(socket, topic_name) do
      socket
    else
      topic = Ideas.create_or_get_topic(topic_name)
      topics = get_topics(socket) ++ [topic]
      update_changeset(socket, %{topics: topics})
    end
  end

  defp remove_topic(socket, topic_name) do
    if topic_name_already_exists?(socket, topic_name) do
      topics =
        get_topics(socket)
        |> Enum.filter(fn topic -> topic.name != topic_name end)
      update_changeset(socket, %{topics: topics})
    else
      socket
    end
  end

  defp remove_last_topic(socket) do
    if count_topics(socket) == 0 do
      socket
    else
      topics =
        get_topics(socket)
        |> Enum.drop(-1)
      update_changeset(socket, %{topics: topics})
    end
  end

  defp update_changeset(socket, changes) do
    assign(socket, changeset: Ecto.Changeset.change(socket.assigns.changeset, changes))
  end

  defp topic_name_already_exists?(socket, topic_name) do
    fetch_field!(socket.assigns.changeset, :topics)
    |> Enum.any?(fn topic -> topic.name == topic_name end)
  end

  defp count_topics(socket) do
    socket.assigns.changeset
    |> fetch_field!(:topics)
    |> Enum.count()
  end
end
