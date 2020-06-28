defmodule TrivialWeb.PageController do
  use TrivialWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
