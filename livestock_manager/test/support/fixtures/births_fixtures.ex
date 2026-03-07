defmodule LivestockManager.BirthsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LivestockManager.Births` context.
  """

  @doc """
  Generate a birth.
  """
  def birth_fixture(attrs \\ %{}) do
    {:ok, birth} =
      attrs
      |> Enum.into(%{
        delivery_date: ~D[2026-03-06],
        female_lambs: 42,
        male_lambs: 42,
        notes: "some notes",
        tagId: "some tagId",
        time_of_day: "some time_of_day"
      })
      |> LivestockManager.Births.create_birth()

    birth
  end
end
