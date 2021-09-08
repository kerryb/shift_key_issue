defmodule ShiftKeyIssueWeb.FooLiveTest do
  use ExUnit.Case
  import Phoenix.ConnTest
  import Phoenix.LiveViewTest
  @endpoint ShiftKeyIssueWeb.Endpoint

  test "shift click" do
    {:ok, view, _html} = build_conn() |> live("/")
    view |> element("#foo") |> render_click(%{"shiftKey" => true})
  end
end
