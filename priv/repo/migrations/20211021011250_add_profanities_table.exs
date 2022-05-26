defmodule Mercurio.Repo.Migrations.AddProfanitiesTable do
  use Ecto.Migration

  def change do
    create table :profanities do
      add :word, :string

      timestamps()
    end

    create unique_index(:profanities, [:word])
  end
end
