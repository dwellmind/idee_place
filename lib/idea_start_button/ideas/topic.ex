defmodule IdeaStartButton.Ideas.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  alias IdeaStartButton.Ideas.Idea
  alias IdeaStartButton.Ideas.IdeaTopic

  schema "topics" do
    field :name, :string
    many_to_many :ideas, Idea, join_through: IdeaTopic

    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint([:name])
  end
end
