defmodule DateDisplayWeb.PageController do
  use DateDisplayWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
