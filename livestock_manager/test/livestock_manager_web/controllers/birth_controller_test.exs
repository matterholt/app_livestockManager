defmodule LivestockManagerWeb.BirthControllerTest do
  use LivestockManagerWeb.ConnCase

  import LivestockManager.BirthsFixtures

  @create_attrs %{tagId: "some tagId", delivery_date: ~D[2026-03-06], time_of_day: "some time_of_day", male_lambs: 42, female_lambs: 42, notes: "some notes"}
  @update_attrs %{tagId: "some updated tagId", delivery_date: ~D[2026-03-07], time_of_day: "some updated time_of_day", male_lambs: 43, female_lambs: 43, notes: "some updated notes"}
  @invalid_attrs %{tagId: nil, delivery_date: nil, time_of_day: nil, male_lambs: nil, female_lambs: nil, notes: nil}

  describe "index" do
    test "lists all births", %{conn: conn} do
      conn = get(conn, ~p"/births")
      assert html_response(conn, 200) =~ "Listing Births"
    end
  end

  describe "new birth" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/births/new")
      assert html_response(conn, 200) =~ "New Birth"
    end
  end

  describe "create birth" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/births", birth: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/births/#{id}"

      conn = get(conn, ~p"/births/#{id}")
      assert html_response(conn, 200) =~ "Birth #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/births", birth: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Birth"
    end
  end

  describe "edit birth" do
    setup [:create_birth]

    test "renders form for editing chosen birth", %{conn: conn, birth: birth} do
      conn = get(conn, ~p"/births/#{birth}/edit")
      assert html_response(conn, 200) =~ "Edit Birth"
    end
  end

  describe "update birth" do
    setup [:create_birth]

    test "redirects when data is valid", %{conn: conn, birth: birth} do
      conn = put(conn, ~p"/births/#{birth}", birth: @update_attrs)
      assert redirected_to(conn) == ~p"/births/#{birth}"

      conn = get(conn, ~p"/births/#{birth}")
      assert html_response(conn, 200) =~ "some updated tagId"
    end

    test "renders errors when data is invalid", %{conn: conn, birth: birth} do
      conn = put(conn, ~p"/births/#{birth}", birth: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Birth"
    end
  end

  describe "delete birth" do
    setup [:create_birth]

    test "deletes chosen birth", %{conn: conn, birth: birth} do
      conn = delete(conn, ~p"/births/#{birth}")
      assert redirected_to(conn) == ~p"/births"

      assert_error_sent 404, fn ->
        get(conn, ~p"/births/#{birth}")
      end
    end
  end

  defp create_birth(_) do
    birth = birth_fixture()

    %{birth: birth}
  end
end
