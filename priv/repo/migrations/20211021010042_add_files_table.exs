defmodule Mercurio.Repo.Migrations.AddFilesTable do
  use Ecto.Migration

  def change do
    create table :files do
      add :name, :string
      add :path, :string

      timestamps()
    end
  end
end
