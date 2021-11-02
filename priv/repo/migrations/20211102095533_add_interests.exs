defmodule IdeaStartButton.Repo.Migrations.AddInterests do
  use Ecto.Migration

  def change do
    create table(:users_interests) do
      add :user_id, references(:users, on_delete: :nothing)
      add :topic_id, references(:topics, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:users_interests, [:user_id, :topic_id])
    create index(:users_interests, [:user_id])
  end
end
