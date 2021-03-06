defmodule Mercurio.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password_hash, :string
      add :name, :string
      add :role, :string
      add :avatar, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
