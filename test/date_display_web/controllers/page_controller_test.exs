defmodule DateDisplayWeb.PageControllerTest do
  use DateDisplayWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "<title>Date Display</title>"
  end
end
