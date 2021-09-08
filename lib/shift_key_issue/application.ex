defmodule ShiftKeyIssue.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ShiftKeyIssueWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ShiftKeyIssue.PubSub},
      # Start the Endpoint (http/https)
      ShiftKeyIssueWeb.Endpoint
      # Start a worker by calling: ShiftKeyIssue.Worker.start_link(arg)
      # {ShiftKeyIssue.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ShiftKeyIssue.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ShiftKeyIssueWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
