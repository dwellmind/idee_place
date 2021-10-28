defmodule IdeaStartButtonWeb.IdeaController do
  use IdeaStartButtonWeb, :controller

  alias IdeaStartButton.Ideas
  alias IdeaStartButton.Ideas.Idea

  def index(conn, _params) do
    ideas = Ideas.list_ideas preload: [:author]
    render(conn, "index.html", ideas: ideas)
  end

  def new(conn, _params) do
    changeset = Ideas.change_idea(%Idea{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"idea" => idea_params}) do
    current_user = conn.assigns.current_user

    idea_params = Map.put(idea_params, "author_id", current_user.id)

    case Ideas.create_idea(idea_params) do
      {:ok, idea} ->
        conn
        |> put_flash(:info, "Idea created successfully.")
        |> redirect(to: Routes.idea_path(conn, :show, idea))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    idea = Ideas.get_idea!(id, preload: [:author])
    render(conn, "show.html", idea: idea)
  end

  def edit(conn, %{"id" => id}) do
    idea = Ideas.get_idea!(id)
    changeset = Ideas.change_idea(idea)
    render(conn, "edit.html", idea: idea, changeset: changeset)
  end

  def update(conn, %{"id" => id, "idea" => idea_params}) do
    idea = Ideas.get_idea!(id)

    case Ideas.update_idea(idea, idea_params) do
      {:ok, idea} ->
        conn
        |> put_flash(:info, "Idea updated successfully.")
        |> redirect(to: Routes.idea_path(conn, :show, idea))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", idea: idea, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    idea = Ideas.get_idea!(id)
    {:ok, _idea} = Ideas.delete_idea(idea)

    conn
    |> put_flash(:info, "Idea deleted successfully.")
    |> redirect(to: Routes.idea_path(conn, :index))
  end
end
