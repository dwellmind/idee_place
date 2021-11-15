defmodule IdeePlace.Repo.Migrations.CreateIdeas do
  use Ecto.Migration

  def change do
    create table(:ideas) do
      add :title, :string
      add :description, :text
      add :author_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:ideas, [:author_id])
  end
end
