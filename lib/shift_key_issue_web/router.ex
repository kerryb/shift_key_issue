defmodule ShiftKeyIssueWeb.Router do
  use ShiftKeyIssueWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ShiftKeyIssueWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShiftKeyIssueWeb do
    pipe_through :browser

    live "/", FooLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShiftKeyIssueWeb do
  #   pipe_through :api
  # end
end
