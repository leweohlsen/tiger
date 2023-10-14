defmodule Tiggern.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "persons" do
    field :name, :string
    field :tier_level, :integer

    timestamps()
  end

  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :tier_level])
    |> validate_required([:name, :tier_level])
  end
end
