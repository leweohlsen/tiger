defmodule TiggernWeb.PersonController do
  use TiggernWeb, :controller

  alias Tiggern.Person
  alias Tiggern.Repo

  def index(conn, _params) do
    persons = Repo.all(Person) # Fetching all persons
    render(conn, "persons.html", persons: persons)
  end

  def create(conn, %{"person" => person_params}) do
    changeset = Person.changeset(%Person{}, person_params)

    case Repo.insert(changeset) do
      {:ok, _person} ->
        conn
        |> put_flash(:info, "Person created successfully.")
        |> redirect(to: ~p"/persons")

      {:error, changeset} ->
        render(conn, "persons.html", changeset: changeset)
    end
  end
end
