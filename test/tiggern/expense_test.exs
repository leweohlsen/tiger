defmodule Tiggern.ExpenseTest do
  use ExUnit.Case, async: false
  alias Tiggern.{Repo, Expense, Person}

  @delta 0.01

  setup do
    # Connect to SQLite Sandbox
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)

    # Insert some test data
    {:ok, alice} = Repo.insert(%Person{name: "Alice", tier_level: 5})
    {:ok, bob} = Repo.insert(%Person{name: "Bob", tier_level: 3})
    {:ok, charlie} = Repo.insert(%Person{name: "Charlie", tier_level: 1})
    {:ok, david} = Repo.insert(%Person{name: "David", tier_level: 0})

    # Return the inserted data so it can be used in the tests
    {:ok, %{alice: alice, bob: bob, charlie: charlie, david: david}}
  end

  test "calculate_split divides the expense correctly", %{alice: alice, bob: bob} do
    {:ok, expense} = Repo.insert(%Expense{description: "Dinner", amount: 100.0, is_covered: false, created_by: alice.id})
    result = Expense.calculate_split(expense)

    alice_share = Enum.find(result, fn %{name: n} -> n == "Alice" end).share
    assert_in_delta alice_share, 55.56, @delta

    bob_share = Enum.find(result, fn %{name: n} -> n == "Bob" end).share
    assert_in_delta bob_share, 33.33, @delta

    charlie_share = Enum.find(result, fn %{name: n} -> n == "Charlie" end).share
    assert_in_delta charlie_share, 11.11, @delta

    david_share = Enum.find(result, fn %{name: n} -> n == "David" end).share
    assert_in_delta david_share, 0.00, @delta
  end
end
