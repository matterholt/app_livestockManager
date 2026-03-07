defmodule LivestockManager.BirthsTest do
  use LivestockManager.DataCase

  alias LivestockManager.Births

  describe "births" do
    alias LivestockManager.Births.Birth

    import LivestockManager.BirthsFixtures

    @invalid_attrs %{tagId: nil, delivery_date: nil, time_of_day: nil, male_lambs: nil, female_lambs: nil, notes: nil}

    test "list_births/0 returns all births" do
      birth = birth_fixture()
      assert Births.list_births() == [birth]
    end

    test "get_birth!/1 returns the birth with given id" do
      birth = birth_fixture()
      assert Births.get_birth!(birth.id) == birth
    end

    test "create_birth/1 with valid data creates a birth" do
      valid_attrs = %{tagId: "some tagId", delivery_date: ~D[2026-03-06], time_of_day: "some time_of_day", male_lambs: 42, female_lambs: 42, notes: "some notes"}

      assert {:ok, %Birth{} = birth} = Births.create_birth(valid_attrs)
      assert birth.tagId == "some tagId"
      assert birth.delivery_date == ~D[2026-03-06]
      assert birth.time_of_day == "some time_of_day"
      assert birth.male_lambs == 42
      assert birth.female_lambs == 42
      assert birth.notes == "some notes"
    end

    test "create_birth/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Births.create_birth(@invalid_attrs)
    end

    test "update_birth/2 with valid data updates the birth" do
      birth = birth_fixture()
      update_attrs = %{tagId: "some updated tagId", delivery_date: ~D[2026-03-07], time_of_day: "some updated time_of_day", male_lambs: 43, female_lambs: 43, notes: "some updated notes"}

      assert {:ok, %Birth{} = birth} = Births.update_birth(birth, update_attrs)
      assert birth.tagId == "some updated tagId"
      assert birth.delivery_date == ~D[2026-03-07]
      assert birth.time_of_day == "some updated time_of_day"
      assert birth.male_lambs == 43
      assert birth.female_lambs == 43
      assert birth.notes == "some updated notes"
    end

    test "update_birth/2 with invalid data returns error changeset" do
      birth = birth_fixture()
      assert {:error, %Ecto.Changeset{}} = Births.update_birth(birth, @invalid_attrs)
      assert birth == Births.get_birth!(birth.id)
    end

    test "delete_birth/1 deletes the birth" do
      birth = birth_fixture()
      assert {:ok, %Birth{}} = Births.delete_birth(birth)
      assert_raise Ecto.NoResultsError, fn -> Births.get_birth!(birth.id) end
    end

    test "change_birth/1 returns a birth changeset" do
      birth = birth_fixture()
      assert %Ecto.Changeset{} = Births.change_birth(birth)
    end
  end
end
