defmodule ShiftKeyIssue.FooTest do
  use ShiftKeyIssue.DataCase

  alias ShiftKeyIssue.Foo

  describe "bar" do
    alias ShiftKeyIssue.Foo.Bar

    import ShiftKeyIssue.FooFixtures

    @invalid_attrs %{}

    test "list_bar/0 returns all bar" do
      bar = bar_fixture()
      assert Foo.list_bar() == [bar]
    end

    test "get_bar!/1 returns the bar with given id" do
      bar = bar_fixture()
      assert Foo.get_bar!(bar.id) == bar
    end

    test "create_bar/1 with valid data creates a bar" do
      valid_attrs = %{}

      assert {:ok, %Bar{} = bar} = Foo.create_bar(valid_attrs)
    end

    test "create_bar/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Foo.create_bar(@invalid_attrs)
    end

    test "update_bar/2 with valid data updates the bar" do
      bar = bar_fixture()
      update_attrs = %{}

      assert {:ok, %Bar{} = bar} = Foo.update_bar(bar, update_attrs)
    end

    test "update_bar/2 with invalid data returns error changeset" do
      bar = bar_fixture()
      assert {:error, %Ecto.Changeset{}} = Foo.update_bar(bar, @invalid_attrs)
      assert bar == Foo.get_bar!(bar.id)
    end

    test "delete_bar/1 deletes the bar" do
      bar = bar_fixture()
      assert {:ok, %Bar{}} = Foo.delete_bar(bar)
      assert_raise Ecto.NoResultsError, fn -> Foo.get_bar!(bar.id) end
    end

    test "change_bar/1 returns a bar changeset" do
      bar = bar_fixture()
      assert %Ecto.Changeset{} = Foo.change_bar(bar)
    end
  end
end
