defmodule LivestockManagerWeb.BirthController do
  use LivestockManagerWeb, :controller

  alias LivestockManager.Births
  alias LivestockManager.Births.Birth

  def index(conn, _params) do
    births = Births.list_births()
    render(conn, :index, births: births)
  end

  def new(conn, _params) do
    changeset = Births.change_birth(%Birth{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"birth" => birth_params}) do
    case Births.create_birth(birth_params) do
      {:ok, birth} ->
        conn
        |> put_flash(:info, "Birth created successfully.")
        |> redirect(to: ~p"/births/#{birth}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    birth = Births.get_birth!(id)
    render(conn, :show, birth: birth)
  end

  def edit(conn, %{"id" => id}) do
    birth = Births.get_birth!(id)
    changeset = Births.change_birth(birth)
    render(conn, :edit, birth: birth, changeset: changeset)
  end

  def update(conn, %{"id" => id, "birth" => birth_params}) do
    birth = Births.get_birth!(id)

    case Births.update_birth(birth, birth_params) do
      {:ok, birth} ->
        conn
        |> put_flash(:info, "Birth updated successfully.")
        |> redirect(to: ~p"/births/#{birth}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, birth: birth, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    birth = Births.get_birth!(id)
    {:ok, _birth} = Births.delete_birth(birth)

    conn
    |> put_flash(:info, "Birth deleted successfully.")
    |> redirect(to: ~p"/births")
  end
end
