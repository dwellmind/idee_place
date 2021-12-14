defmodule IdeePlace.Repo.Migrations.CreateUsersStarredIdeasTable do
  use Ecto.Migration

  def change do
    create table(:users_starred_ideas) do
      add :user_id, references(:users, on_delete: :nothing)
      add :idea_id, references(:ideas, on_delete: :nothing)

      timestamps()
    end

    create index(:users_starred_ideas, [:user_id])
    create index(:users_starred_ideas, [:idea_id])
    create unique_index(:users_starred_ideas, [:user_id, :idea_id])
  end
end
