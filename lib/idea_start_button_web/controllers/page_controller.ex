defmodule IdeaStartButtonWeb.PageController do
  use IdeaStartButtonWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
