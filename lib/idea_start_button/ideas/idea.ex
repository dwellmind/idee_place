defmodule IdeaStartButton.Ideas.Idea do
  use Ecto.Schema
  import Ecto.Changeset

  alias IdeaStartButton.Accounts.User
  alias IdeaStartButton.Ideas.Topic
  alias IdeaStartButton.Ideas.IdeaTopic

  schema "ideas" do
    field :title, :string
    field :description, :string
    belongs_to :author, User
    many_to_many :topics, Topic, join_through: IdeaTopic

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
