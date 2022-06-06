defmodule Mercurio.Repo.Migrations.AddOrganizationsRoomsTable do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :name, :string
      add :status, :boolean
      add :allow_gif, :boolean
      add :show_emoji_button, :boolean
      add :message_reactions, :boolean
      add :show_users_online, :boolean
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end

    create index(:rooms, [:user_id])
  end
end
