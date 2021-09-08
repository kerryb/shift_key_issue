defmodule ShiftKeyIssueWeb.BarLiveTest do
  use ShiftKeyIssueWeb.ConnCase

  import Phoenix.LiveViewTest
  import ShiftKeyIssue.FooFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_bar(_) do
    bar = bar_fixture()
    %{bar: bar}
  end

  describe "Index" do
    setup [:create_bar]

    test "lists all bar", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.bar_index_path(conn, :index))

      assert html =~ "Listing Bar"
    end

    test "saves new bar", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.bar_index_path(conn, :index))

      assert index_live |> element("a", "New Bar") |> render_click() =~
               "New Bar"

      assert_patch(index_live, Routes.bar_index_path(conn, :new))

      assert index_live
             |> form("#bar-form", bar: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#bar-form", bar: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.bar_index_path(conn, :index))

      assert html =~ "Bar created successfully"
    end

    test "updates bar in listing", %{conn: conn, bar: bar} do
      {:ok, index_live, _html} = live(conn, Routes.bar_index_path(conn, :index))

      assert index_live |> element("#bar-#{bar.id} a", "Edit") |> render_click() =~
               "Edit Bar"

      assert_patch(index_live, Routes.bar_index_path(conn, :edit, bar))

      assert index_live
             |> form("#bar-form", bar: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#bar-form", bar: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.bar_index_path(conn, :index))

      assert html =~ "Bar updated successfully"
    end

    test "deletes bar in listing", %{conn: conn, bar: bar} do
      {:ok, index_live, _html} = live(conn, Routes.bar_index_path(conn, :index))

      assert index_live |> element("#bar-#{bar.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#bar-#{bar.id}")
    end
  end

  describe "Show" do
    setup [:create_bar]

    test "displays bar", %{conn: conn, bar: bar} do
      {:ok, _show_live, html} = live(conn, Routes.bar_show_path(conn, :show, bar))

      assert html =~ "Show Bar"
    end

    test "updates bar within modal", %{conn: conn, bar: bar} do
      {:ok, show_live, _html} = live(conn, Routes.bar_show_path(conn, :show, bar))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Bar"

      assert_patch(show_live, Routes.bar_show_path(conn, :edit, bar))

      assert show_live
             |> form("#bar-form", bar: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#bar-form", bar: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.bar_show_path(conn, :show, bar))

      assert html =~ "Bar updated successfully"
    end
  end
end
