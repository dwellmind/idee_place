defmodule IdeePlaceWeb.TopicController do
  use IdeePlaceWeb, :controller

  import Phoenix.LiveView.Controller, only: [live_render: 3]

  def index(conn, _param) do
    live_render(conn, IdeePlaceWeb.TopicLive.Index, [])
  end
end
