defmodule IdeaStartButton.IdeasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IdeaStartButton.Ideas` context.
  """

  @doc """
  Generate a idea.
  """
  def idea_fixture(attrs \\ %{}) do
    {:ok, idea} =
      attrs
      |> Enum.into(%{
        title: "Some title",
        description: "Some description"
      })
      |> IdeaStartButton.Ideas.create_idea()

    idea
  end
end
