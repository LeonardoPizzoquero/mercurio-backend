defmodule Mercurio.Repo.Migrations.AddRoomBanUsers do
  use Ecto.Migration

  def change do
    create table (:room_ban_users, primary_key: false) do
      add :is_banned, :boolean
      add :user_id, references(:users, type: :binary_id)
      add :room_id, references(:rooms, type: :binary_id)

      timestamps()
    end
  end
end
