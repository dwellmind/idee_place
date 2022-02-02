defmodule IdeePlaceWeb.AboutController do
  use IdeePlaceWeb, :controller

  def index(conn, _param) do
    render(conn, "index.html")
  end
end
