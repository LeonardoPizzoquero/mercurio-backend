defmodule Mercurio.Repo.Migrations.AddMessagesLikesTable do
  use Ecto.Migration

  def change do
    create table(:messages_likes, primary_key: false) do
      add :message_id, references(:messages, type: :binary_id)
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end
  end
end
