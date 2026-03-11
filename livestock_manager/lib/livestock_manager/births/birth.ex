defmodule LivestockManager.Births.Birth do
  use Ecto.Schema
  import Ecto.Changeset

  schema "births" do
    field :tagId, :string
    field :delivery_date, :date
    field :time_of_day, Ecto.Enum, values: [:AM, :PM]
    field :male_lambs, :integer
    field :female_lambs, :integer
    field :notes, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(birth, attrs) do
    birth
    |> cast(attrs, [:tagId, :delivery_date, :time_of_day, :male_lambs, :female_lambs, :notes])
    |> validate_required([
      :tagId,
      :delivery_date,
      :time_of_day,
      :male_lambs,
      :female_lambs,
      :notes
    ])
  end
end
