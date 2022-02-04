defmodule IdeePlaceWeb.IdeaController do
  use IdeePlaceWeb, :controller

  alias IdeePlace.Ideas
  alias IdeePlace.Ideas.Idea

  import Phoenix.LiveView.Controller, only: [live_render: 3]

  def index(conn, _param) do
    live_render(conn, IdeePlaceWeb.IdeaLive.Index, [])
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
    live_render(conn, IdeePlaceWeb.IdeaLive.Show, session: %{"idea_id" => id})
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
