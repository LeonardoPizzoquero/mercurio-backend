defmodule Mercurio.Repo.Migrations.AddMessagesTable do
  use Ecto.Migration

  def change do
    create table :messages do
      add :content, :string
      add :fixed, :boolean
      add :type, :string
      add :likes, :integer, default: 0
      add :replied_message_id, references(:messages, type: :binary_id), allow_nil: true
      add :room_id, references(:rooms, type: :binary_id)
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end

    create index(:messages, [:user_id])
    create index(:messages, [:room_id])
    create index(:messages, [:replied_message_id])
  end
end
