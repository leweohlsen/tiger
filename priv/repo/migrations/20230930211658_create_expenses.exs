defmodule Tiggern.Repo.Migrations.CreateExpenses do
  use Ecto.Migration

  def change do
    create table(:expenses) do
      add :description, :string
      add :amount, :decimal
      add :is_covered, :boolean, default: false
      add :created_by, references(:persons, on_delete: :delete_all)

      timestamps()
    end

    create index(:expenses, [:created_by])
  end
end
