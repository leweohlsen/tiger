defmodule TiggernWeb.ExpenseController do
  use TiggernWeb, :controller

  alias Tiggern.Person
  alias Tiggern.Expense
  alias Tiggern.Repo

  def index(conn, _params) do
    expenses = Repo.all(Expense)
    persons = Repo.all(Person)
    render(conn, "expenses.html", expenses: expenses, persons: persons)
  end

  def create(conn, %{"expense" => expense_params}) do
    changeset = Expense.changeset(%Expense{}, expense_params)

    case Repo.insert(changeset) do
      {:ok, _expense} ->
        conn
        |> put_flash(:info, "Expense created successfully.")
        |> redirect(to: ~p"/expenses")

      {:error, changeset} ->
        render(conn, "expenses.html", changeset: changeset)
    end
  end
end
