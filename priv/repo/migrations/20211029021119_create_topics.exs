defmodule IdeaStartButton.Repo.Migrations.CreateTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :name, :string

      timestamps()
    end

    create unique_index(:topics, [:name])

    create table(:ideas_topics) do
      add :idea_id, references(:ideas, on_delete: :nothing)
      add :topic_id, references(:topics, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:ideas_topics, [:idea_id, :topic_id])
    create index(:ideas_topics, [:idea_id])
  end
end
