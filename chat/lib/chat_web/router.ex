defmodule ChatWeb.Router do
  use ChatWeb, :router
  use Phoenix.Router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ChatWeb.LayoutView, :root}
    # plug :protect_from_forgery # disable CSRF
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChatWeb do
    pipe_through :browser
    live "/chat", ChatLive, :index
    live "/room:name", ChatroomLive, :index

    get "/", PageController, :index
  end
end
