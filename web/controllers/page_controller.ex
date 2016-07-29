defmodule Benchmarker.PageController do
  use Benchmarker.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
