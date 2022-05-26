defmodule Mercurio.Repo.Migrations.AddRoomReportsTable do
  use Ecto.Migration

  def change do
    create table :room_reports do
      add :room_id, references(:rooms, type: :binary_id)
      add :message_id, references(:messages, type: :binary_id)
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end
  end
end
