defmodule ChatWeb.Router do
  use ChatWeb, :router

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
    post "/send", MessageController, :send_message
  end
end
