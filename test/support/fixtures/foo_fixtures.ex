defmodule ShiftKeyIssue.FooFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ShiftKeyIssue.Foo` context.
  """

  @doc """
  Generate a bar.
  """
  def bar_fixture(attrs \\ %{}) do
    {:ok, bar} =
      attrs
      |> Enum.into(%{

      })
      |> ShiftKeyIssue.Foo.create_bar()

    bar
  end
end
