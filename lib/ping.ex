defmodule PingMeUp.Ping do
  use GenServer

  require Logger

  @ping_url System.get_env("PING_URL")
  # @interval 60_000 * 5 # every 5 minutes
  @interval 60_000

  def start_link do
    GenServer.start_link(__MODULE__, :ok)
  end

  def schedule_ping() do
    Process.send_after(self(), :ping, @interval)
  end

  def init(:ok) do
    schedule_ping()
    {:ok, %{}}
  end

  def handle_info(:ping, state) do
    ping()
    schedule_ping()
    {:noreply, state}
  end

  defp ping do
    HTTPoison.get(@ping_url)
    |> Logger.info()
  end
end
