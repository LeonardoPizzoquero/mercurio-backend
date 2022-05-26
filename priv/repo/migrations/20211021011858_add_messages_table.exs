defmodule Mercurio.Repo.Migrations.AddMessagesTable do
  use Ecto.Migration

  def change do
    create table :messages do
      add :content, :string
      add :fixed, :boolean
      add :type, :string
      add :active, :boolean
      add :room_id, references(:rooms, type: :binary_id)
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end
  end
end
