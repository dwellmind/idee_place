defmodule IdeaStartButton.IdeasTest do
  use IdeaStartButton.DataCase

  alias IdeaStartButton.Ideas

  describe "ideas" do
    alias IdeaStartButton.Ideas.Idea

    import IdeaStartButton.IdeasFixtures

    @invalid_attrs %{
      title: nil,
      description: nil,
      author_id: nil
    }

    test "list_ideas/0 returns all ideas" do
      idea = idea_fixture()
      assert Ideas.list_ideas() == [idea]
    end

    test "get_idea!/1 returns the idea with given id" do
      idea = idea_fixture()
      assert Ideas.get_idea!(idea.id) == idea
    end

    test "create_idea/1 with valid data creates a idea" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Idea{} = idea} = Ideas.create_idea(valid_attrs)
      assert idea.title == "some title"
      assert idea.description == "some description"
    end

    test "create_idea/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ideas.create_idea(@invalid_attrs)
    end

    test "update_idea/2 with valid data updates the idea" do
      idea = idea_fixture()
      update_attrs = %{
        title: "some updated title",
        description: "some updated description"
      }

      assert {:ok, %Idea{} = idea} = Ideas.update_idea(idea, update_attrs)
      assert idea.description == "some updated description"
      assert idea.title == "some updated title"
    end

    test "update_idea/2 with invalid data returns error changeset" do
      idea = idea_fixture()
      assert {:error, %Ecto.Changeset{}} = Ideas.update_idea(idea, @invalid_attrs)
      assert idea == Ideas.get_idea!(idea.id)
    end

    test "delete_idea/1 deletes the idea" do
      idea = idea_fixture()
      assert {:ok, %Idea{}} = Ideas.delete_idea(idea)
      assert_raise Ecto.NoResultsError, fn -> Ideas.get_idea!(idea.id) end
    end

    test "change_idea/1 returns a idea changeset" do
      idea = idea_fixture()
      assert %Ecto.Changeset{} = Ideas.change_idea(idea)
    end
  end
end
