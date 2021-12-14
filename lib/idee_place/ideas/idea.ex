defmodule IdeePlace.Ideas.Idea do
  use Ecto.Schema
  import Ecto.Changeset

  alias IdeePlace.Accounts.User
  alias IdeePlace.Ideas.Topic
  alias IdeePlace.Ideas.IdeaTopic
  alias IdeePlace.Ideas.UserStarredIdea

  schema "ideas" do
    field :title, :string
    field :description, :string

    belongs_to :author, User
    many_to_many :topics, Topic, join_through: IdeaTopic
    many_to_many :starred_by, User, join_through: UserStarredIdea

    timestamps()
  end

  @doc false
  def changeset(idea, attrs) do
    idea
    |> cast(attrs, [:title, :description, :author_id])
    |> validate_required([:title, :description])
    |> assoc_constraint(:author)
  end
end
