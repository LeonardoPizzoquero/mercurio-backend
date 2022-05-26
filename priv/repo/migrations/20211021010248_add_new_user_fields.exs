defmodule Mercurio.Repo.Migrations.AddNewUserFields do
  use Ecto.Migration

  def change do
    alter table :users do
      add :avatar_id, references(:files, type: :binary_id)
    end
  end
end
