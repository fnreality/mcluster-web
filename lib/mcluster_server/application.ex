defmodule MclusterServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # Start the Erlang Term Storage (ETS)
    :ets.new :mcluster_cache, [:named_table]
    children = [
      # Starts a worker by calling: MclusterServer.Worker.start_link(arg)
      # {MclusterServer.Worker, arg}
	{
	    Plug.Cowboy,
            scheme: :http,
            plug: MclusterServer.Router,
	    options: [port: 8087]
	}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MclusterServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
