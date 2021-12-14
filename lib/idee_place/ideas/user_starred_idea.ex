defmodule IdeePlace.Ideas.UserStarredIdea do
  use Ecto.Schema
  import Ecto.Changeset

  alias IdeePlace.Accounts.User
  alias IdeePlace.Ideas.Idea

  schema "users_starred_ideas" do
    belongs_to :user, User
    belongs_to :idea, Idea

    timestamps()
  end

  @doc false
  def changeset(user_starred_idea, attrs) do
    user_starred_idea
    |> cast(attrs, [:user_id, :idea_id])
    |> validate_required([:user_id, :idea_id])
    |> unsafe_validate_unique([:user_id, :idea_id], IdeePlace.Repo)
    |> unique_constraint([:user_id, :idea_id])
  end
end
