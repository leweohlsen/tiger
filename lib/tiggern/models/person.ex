defmodule Tiggern.Person do
  use Ecto.Schema

  schema "persons" do
    field :name, :string
    field :tier_level, :integer

    timestamps()
  end
end
