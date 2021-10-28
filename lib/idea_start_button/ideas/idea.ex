defmodule IdeaStartButton.Ideas.Idea do
  use Ecto.Schema
  import Ecto.Changeset

  alias IdeaStartButton.Accounts.User

  schema "ideas" do
    field :description, :string
    field :title, :string
    belongs_to :author, User

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
