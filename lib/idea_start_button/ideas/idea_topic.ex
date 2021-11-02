defmodule IdeaStartButton.Ideas.IdeaTopic do
  use Ecto.Schema
  import Ecto.Changeset

  alias IdeaStartButton.Ideas.Idea
  alias IdeaStartButton.Ideas.Topic

  schema "ideas_topics" do
    belongs_to :idea, Idea
    belongs_to :topic, Topic

    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:idea_id, :topic_id])
    |> validate_required([:idea_id, :topic_id])
    |> unsafe_validate_unique([:idea_id, :topic_id], IdeaStartButton.Repo)
    |> unique_constraint([:idea_id, :topic_id])
  end
end
