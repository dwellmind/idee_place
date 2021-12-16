defmodule IdeePlace.Repo.Migrations.RenameTableUsersInterestsIntoUsersStarredTopics do
  use Ecto.Migration

  def change do
    drop index(:users_interests, :user_id)
    drop index(:users_interests, [:user_id, :topic_id])
    drop constraint(:users_interests, "users_interests_user_id_fkey")
    drop constraint(:users_interests, "users_interests_topic_id_fkey")
    drop constraint(:users_interests, "users_interests_pkey")

    rename table(:users_interests), to: table(:users_starred_topics)

    alter table(:users_starred_topics) do
      # "Modifying" the columns rengenerates the constraints
      # with the correct new names. These were the same types
      # and options the columns were originally created with
      # in previous migrations.
      modify :id, :bigint, primary_key: true
      modify :user_id, references(:users)
      modify :topic_id, references(:topics)
    end

    execute "ALTER SEQUENCE users_interests_id_seq RENAME TO users_starred_topics_id_seq;"

    create unique_index(:users_starred_topics, [:user_id, :topic_id])
    create index(:users_starred_topics, [:user_id])
  end
end
