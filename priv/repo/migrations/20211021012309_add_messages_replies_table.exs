defmodule Mercurio.Repo.Migrations.AddMessagesRepliesTable do
  use Ecto.Migration

  def change do
    create table :messages_replies do
      add :message_replied_id, references(:messages, type: :binary_id)
      add :message_id, references(:messages, type: :binary_id)

      timestamps()
    end
  end
end
