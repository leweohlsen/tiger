defmodule Tiggern.Expense do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tiggern.Repo
  alias Tiggern.Person

  schema "expenses" do
    field :description, :string
    field :amount, :decimal
    field :is_covered, :boolean, default: false

    belongs_to :person, Tiggern.Person, foreign_key: :created_by

    timestamps()
  end

  def changeset(expense, attrs) do
    expense
    |> cast(attrs, [:description, :amount, :is_covered, :created_by])
    |> validate_required([:description, :amount, :created_by])
    |> assoc_constraint(:person)
  end

  def calculate_split(expense) do
    # Get all persons
    persons = Repo.all(Person)

    # Calculate total tier level
    total_tier = Enum.reduce(persons, 0, fn person, acc -> person.tier_level + acc end)

    # Calculate share for each person
    persons_share = Enum.map(persons, fn person ->
      %{name: person.name, share: (person.tier_level / total_tier) * expense.amount}
    end)

    persons_share
  end
end
