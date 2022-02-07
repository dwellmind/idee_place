defmodule IdeePlaceWeb.IdeaControllerTest do
  use IdeePlaceWeb.ConnCase

  import IdeePlace.IdeasFixtures

  @create_attrs %{
    title: "Some title",
    description: "Some description"
  }

  @update_attrs %{
    title: "Some updated title",
    description: "Some updated description"
  }

  @invalid_attrs %{
    title: nil,
    description: nil
  }

  describe "index" do
    test "lists all ideas", %{conn: conn} do
      conn = get(conn, Routes.idea_path(conn, :index))
      assert html_response(conn, 200) =~ "Ideas"
      assert html_response(conn, 200) =~ "search_query"
    end
  end

  describe "new idea" do
    setup :register_and_log_in_user

    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.idea_path(conn, :new))
      assert html_response(conn, 200) =~ "<h1>New Idea</h1>"
    end
  end

  describe "create idea" do
    setup :register_and_log_in_user

    @tag runonly: true
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.idea_path(conn, :create), idea: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.idea_path(conn, :show, id)

      conn = get(conn, Routes.idea_path(conn, :show, id))
      assert html_response(conn, 200) =~ "id=\"idea-title\""
      assert html_response(conn, 200) =~ "id=\"idea-topics\""
      assert html_response(conn, 200) =~ "id=\"idea-description\""
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.idea_path(conn, :create), idea: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Idea"
    end
  end

  describe "edit idea" do
    setup :register_and_log_in_user
    setup :create_idea

    test "renders form for editing chosen idea", %{conn: conn, idea: idea} do
      conn = get(conn, Routes.idea_path(conn, :edit, idea))
      assert html_response(conn, 200) =~ "id=\"idea_title\""
      assert html_response(conn, 200) =~ "id=\"idea_description\""
    end
  end

  describe "update idea" do
    setup :register_and_log_in_user
    setup :create_idea

    test "redirects when data is valid", %{conn: conn, idea: idea} do
      conn = put(conn, Routes.idea_path(conn, :update, idea), idea: @update_attrs)
      assert redirected_to(conn) == Routes.idea_path(conn, :show, idea)

      conn = get(conn, Routes.idea_path(conn, :show, idea))
      assert html_response(conn, 200) =~ "Some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, idea: idea} do
      conn = put(conn, Routes.idea_path(conn, :update, idea), idea: @invalid_attrs)
      assert html_response(conn, 200) =~ "id=\"idea_title\""
      assert html_response(conn, 200) =~ "id=\"idea_description\""
    end
  end

  describe "delete idea" do
    setup :register_and_log_in_user
    setup :create_idea

    test "deletes chosen idea", %{conn: conn, idea: idea} do
      conn = delete(conn, Routes.idea_path(conn, :delete, idea))

      assert redirected_to(conn) == Routes.idea_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.idea_path(conn, :show, idea))
      end
    end
  end

  defp create_idea(context) do
    current_user = context.user
    idea = idea_fixture(Map.put(@create_attrs, :author_id, current_user.id))
    %{idea: idea}
  end
end
