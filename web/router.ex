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
    plug :accepts, ["json"]
    plug CORSPlug, [origin: "*"]
  end

  scope "/", SampleServices do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/steps", StepController
  end

  # Other scopes may use custom stacks.
  scope "/api", SampleServices do
    pipe_through :api
    get "/color", PageController, :color
    get "/phunt", ProductHuntController, :search
    get "/getRandom/:beat", StepController, :get

  end
end
