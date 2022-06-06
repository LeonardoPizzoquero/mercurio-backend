defmodule Mercurio.Repo.Migrations.AddAvatarsTable do
  use Ecto.Migration

  def change do
    create table(:avatars) do
      add :path, :string
      add :name, :string
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end
  end
end
