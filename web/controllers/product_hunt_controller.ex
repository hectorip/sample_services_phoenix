defmodule SampleServices.ProductHuntController do
  use SampleServices.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def search(conn, _params) do
    HTTPoison.start
    url = "https://api.producthunt.com/v1/posts"
    api_token = System.get_env("API_TOKEN_PHUNT")

    { :ok, doby } = HTTPoison.get(url, [{"Authorization", "Bearer " <> api_token}])

    data = Poison.decode!(doby.body)
    
    json conn, %{product: Enum.random(data["posts"])}
  end

end
