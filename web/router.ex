defmodule SampleServices.Router do
  use SampleServices.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug Corsica, origins: ["http://localhost.dev"]
    plug :accepts, ["json"]
  end

  scope "/", SampleServices do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", SampleServices do
    pipe_through :api
    get "/color", PageController, :color
  end
end
