defmodule Tiggern.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TiggernWeb.Telemetry,
      # Start the Ecto repository
      Tiggern.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Tiggern.PubSub},
      # Start Finch
      {Finch, name: Tiggern.Finch},
      # Start the Endpoint (http/https)
      TiggernWeb.Endpoint
      # Start a worker by calling: Tiggern.Worker.start_link(arg)
      # {Tiggern.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tiggern.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TiggernWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
