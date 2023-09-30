defmodule Tiggern.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :name, :string, null: false
      add :tier_level, :integer, default: 2

      timestamps()
    end
  end
end
