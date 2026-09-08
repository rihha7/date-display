defmodule DateDisplayWeb.PageController do
  use DateDisplayWeb, :controller

  def home(conn, _params) do
    conn |> render(
      :home,
      date: "01",
      month: "12",
      year: "2026"
    )
  end
end
