defmodule IdeePlaceWeb.IdeasLiveTest do
  use IdeePlaceWeb.ConnCase

  import Phoenix.LiveViewTest
  import IdeePlace.IdeasFixtures

  setup :register_and_log_in_user

  describe "without ideas" do
    test "show the ideas list", %{conn: conn} do
      {:ok, view, _html} = live(conn, Routes.idea_path(conn, :index))

      html =
        view
        |> form("#ideas-search", search: %{query: ""})
        |> render_submit()

      assert html =~ "No ideas yet."

      html =
        view
        |> form("#ideas-search", search: %{query: "Some desc"})
        |> render_submit()

      assert html =~ "The query does not match any ideas."
    end
  end

  describe "with ideas" do
    setup :create_idea

    test "show the ideas list", %{conn: conn} do
      {:ok, view, _html} = live(conn, Routes.idea_path(conn, :index))

      html =
        view
        |> form("#ideas-search", search: %{query: ""})
        |> render_submit()

      assert html =~ "Some description"
    end

    test "show the ideas list filtered", %{conn: conn} do
      {:ok, view, _html} = live(conn, Routes.idea_path(conn, :index))

      html =
        view
        |> form("#ideas-search", search: %{query: "No match filter"})
        |> render_submit()

      assert html =~ "The query does not match any ideas."

      html =
        view
        |> form("#ideas-search", search: %{query: "Some desc"})
        |> render_submit()

      assert html =~ "Some description"
    end
  end

  defp create_idea(context) do
    current_user = context.user
    idea = idea_fixture(Map.put(%{}, :author_id, current_user.id))
    %{idea: idea}
  end
end
