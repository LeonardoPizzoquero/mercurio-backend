defmodule Mercurio.Repo.Migrations.AddMessagesRepliesTable do
  use Ecto.Migration

  def change do
    create table :messages_replies, primary_key: false do
      add :reply_target_message_id, references(:messages, type: :binary_id)
      add :message_id, references(:messages, type: :binary_id)

      timestamps()
    end
  end
end
