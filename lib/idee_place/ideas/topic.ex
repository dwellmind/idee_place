defmodule IdeePlace.Ideas.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  alias IdeePlace.Accounts.User
  alias IdeePlace.Ideas.Idea
  alias IdeePlace.Ideas.IdeaTopic
  alias IdeePlace.Ideas.UserStarredTopic

  schema "topics" do
    field :name, :string
    many_to_many :ideas, Idea, join_through: IdeaTopic
    many_to_many :starred_by, User, join_through: UserStarredTopic

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
