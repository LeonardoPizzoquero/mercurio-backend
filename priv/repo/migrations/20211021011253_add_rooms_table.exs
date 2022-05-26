defmodule Mercurio.Repo.Migrations.AddOrganizationsRoomsTable do
  use Ecto.Migration

  def change do
    create table :rooms do
      add :name, :string
      add :status, :boolean
      add :direct_messages, :boolean
      add :pre_moderation, :boolean
      add :allow_links, :boolean
      add :allow_gif, :boolean
      add :show_emoji_button, :boolean
      add :message_reactions, :boolean
      add :show_users_online, :boolean
      add :users_online, :integer
      add :profanity_id, references(:profanities, type: :binary_id)
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end
  end
end
