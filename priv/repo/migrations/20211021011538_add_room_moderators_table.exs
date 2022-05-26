defmodule Mercurio.Repo.Migrations.AddRoomModeratorsTable do
  use Ecto.Migration

  def change do
    create table :room_moderators do
      add :user_id, references(:users, type: :binary_id)
      add :room_id, references(:rooms, type: :binary_id)

      timestamps()
    end
  end
end
