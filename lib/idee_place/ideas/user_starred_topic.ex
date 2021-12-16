defmodule IdeePlace.Ideas.UserStarredTopic do
  use Ecto.Schema
  import Ecto.Changeset

  alias IdeePlace.Accounts.User
  alias IdeePlace.Ideas.Topic

  schema "users_starred_topics" do
    belongs_to :user, User
    belongs_to :topic, Topic

    timestamps()
  end

  @doc false
  def changeset(user_starred_topic, attrs) do
    user_starred_topic
    |> cast(attrs, [:user_id, :topic_id])
    |> validate_required([:user_id, :topic_id])
    |> unsafe_validate_unique([:user_id, :topic_id], IdeePlace.Repo)
    |> unique_constraint([:user_id, :topic_id])
  end
end
