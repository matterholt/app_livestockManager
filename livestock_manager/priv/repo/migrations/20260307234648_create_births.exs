defmodule LivestockManager.Repo.Migrations.CreateBirths do
  use Ecto.Migration

  def change do
    create table(:births) do
      add :tagId, :string
      add :delivery_date, :date
      add :time_of_day, :string
      add :male_lambs, :integer
      add :female_lambs, :integer
      add :notes, :string

      timestamps(type: :utc_datetime)
    end

    create constraint(:births, :time_of_day, check: "time_of_day IN ('AM', 'PM')")
  end
end
