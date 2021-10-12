defmodule ChatWeb.ChatLive do
  use ChatWeb, :live_view
  require Phoenix.Logger

  def render(assigns) do
    ~H"""
    TEST
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end

  @impls true
  def handle_event("room", _params, socket) do
    Phoenix.Logger.info("test")
    {:noreply, socket}
  end
end