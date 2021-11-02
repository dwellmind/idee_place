defmodule IdeaStartButton.Ideas.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  alias IdeaStartButton.Ideas.Idea
  alias IdeaStartButton.Ideas.IdeaTopic
  alias IdeaStartButton.Accounts.User
  alias IdeaStartButton.Accounts.UserInterest

  schema "topics" do
    field :name, :string
    many_to_many :ideas, Idea, join_through: IdeaTopic
    many_to_many :those_concerned, User, join_through: UserInterest

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
