defmodule Welcome.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Welcome.Repo,
      # Start the Telemetry supervisor
      WelcomeWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Welcome.PubSub},
      # Start the Endpoint (http/https)
      WelcomeWeb.Endpoint,
      WelcomeWeb.Presence
      # Start a worker by calling: Welcome.Worker.start_link(arg)
      # {Welcome.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Welcome.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WelcomeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
