defmodule Mercurio.Repo.Migrations.AddRoomConnectedUsersTable do
  use Ecto.Migration

  def change do
    create table :room_connected_users, primary_key: false do
      add :room_id, references(:rooms, type: :binary_id)
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end
  end
end
