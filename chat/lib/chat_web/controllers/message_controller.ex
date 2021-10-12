defmodule ChatWeb.MessageController do
  use ChatWeb, :controller

  def send_message(conn, %{"name" => name, "message" => message}) do
    json(conn, %{response: message <> " " <> name})
  end
end
