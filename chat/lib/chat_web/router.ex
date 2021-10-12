defmodule ChatWeb.Router do
  use ChatWeb, :router
  use Phoenix.Router
  import Phoenix.LiveView.Router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChatWeb do
    pipe_through :api
    live "/chat", ChatLive, :index
    live "/room:name", ChatroomLive, :index

    get "/", PageController, :index
  end
end
