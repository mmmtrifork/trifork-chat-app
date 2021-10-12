defmodule ChatWeb.ChatroomLive do
  use ChatWeb, :live_view
  require Logger

  @impl true
  def mount(%{"name" => chatroom_name}, _session, socket) do
    topic = "room:" <> chatroom_name
    ChatWeb.Endpoint.subscribe(topic)
    {:ok, assign(socket,
      chatroom_name: chatroom_name,
      topic: topic,
      messages: ["Welcome to OranguChat"],
      temporary_assigns: [messages: []])
    }
  end

  @impl true
  def handle_event("send_message", %{"chat" => %{"message" => message}}, socket) do
    Logger.info(message: message)
    ChatWeb.Endpoint.broadcast(socket.assigns.topic, "new-message", message)
    {:noreply, socket}
  end

  @impl true
  def handle_info(%{event: "new-message", payload: message}, socket) do
    Logger.info(payload: message)
    {:noreply, assign(socket, messages: socket.assigns.messages ++ [message])}
  end

end
