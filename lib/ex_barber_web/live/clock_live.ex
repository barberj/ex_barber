defmodule ExBarberWeb.ClockLive do
  use ExBarberWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tick)
    {:ok, put_date(socket)}
  end

  def render(assigns) do
    ~L"""
      <h2>It's <%= DateTime.to_iso8601(@date) %></h2>
    """
  end

  def handle_info(:tick, socket) do
    {:noreply, put_date(socket)}
  end

  defp put_date(socket) do
    IO.puts("updating date")
    assign(socket, date: DateTime.utc_now())
  end
end
