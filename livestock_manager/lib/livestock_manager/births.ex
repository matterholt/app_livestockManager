defmodule LivestockManager.Births do
  @moduledoc """
  The Births context.
  """

  import Ecto.Query, warn: false
  alias LivestockManager.Repo

  alias LivestockManager.Births.Birth

  @doc """
  Returns the list of births.

  ## Examples

      iex> list_births()
      [%Birth{}, ...]

  """
  def list_births do
    Repo.all(Birth)
  end

  @doc """
  Gets a single birth.

  Raises `Ecto.NoResultsError` if the Birth does not exist.

  ## Examples

      iex> get_birth!(123)
      %Birth{}

      iex> get_birth!(456)
      ** (Ecto.NoResultsError)

  """
  def get_birth!(id), do: Repo.get!(Birth, id)

  @doc """
  Creates a birth.

  ## Examples

      iex> create_birth(%{field: value})
      {:ok, %Birth{}}

      iex> create_birth(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_birth(attrs) do
    %Birth{}
    |> Birth.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a birth.

  ## Examples

      iex> update_birth(birth, %{field: new_value})
      {:ok, %Birth{}}

      iex> update_birth(birth, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_birth(%Birth{} = birth, attrs) do
    birth
    |> Birth.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a birth.

  ## Examples

      iex> delete_birth(birth)
      {:ok, %Birth{}}

      iex> delete_birth(birth)
      {:error, %Ecto.Changeset{}}

  """
  def delete_birth(%Birth{} = birth) do
    Repo.delete(birth)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking birth changes.

  ## Examples

      iex> change_birth(birth)
      %Ecto.Changeset{data: %Birth{}}

  """
  def change_birth(%Birth{} = birth, attrs \\ %{}) do
    Birth.changeset(birth, attrs)
  end
end
