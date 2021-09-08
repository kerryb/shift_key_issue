defmodule ShiftKeyIssueWeb.PageController do
  use ShiftKeyIssueWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
