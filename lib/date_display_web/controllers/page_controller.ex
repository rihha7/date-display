defmodule DateDisplayWeb.PageController do
  use DateDisplayWeb, :controller

  @local        NaiveDateTime.local_now
  @days_of_week ~w(monday tuesday wednesday thursday friday saturday sunday)
  @month        ~w(january february march april may june july august september october november december)

  def index(conn, _params), do: render(conn, :index, date: pad(@local.day, 2))

  def home(conn, _params) do
    day_index = @local |> NaiveDateTime.to_date |> Date.day_of_week
    day_of_week = @days_of_week |> Enum.at(day_index - 1) 
    month = @month |> Enum.at(@local.month - 1)

    conn |> render(
      :home,
      day: gettext_value(day_of_week),
      date: pad(@local.day, 2),
      month_name: gettext_value(month),
      month_numeric: pad(@local.month, 2),
      year: pad(@local.year, 4),

      season: gettext_value(month |> get_season),
      is_leap_year: @local.year |> is_leap_year?,
      leap_year_msg: @local.year |> leap_msg |> gettext_value,
      next_leap_year: @local.year + 1 |> next_leap_msg
    )
  end

  # -----

  defp pad(n, lead), do: String.pad_leading("#{n}", lead, "0")

  defp is_leap_year?(y), do: (rem(y, 4) == 0 and rem(y, 100) != 0) or rem(y, 400) == 0

  defp leap_msg(y) do
    if is_leap_year?(y),
      do: gettext("%{year} is a leap year", year: y),
      else: gettext("%{year} is not a leap year", year: y)
  end

  defp next_leap_msg(y) do
    if is_leap_year?(y),
      do: gettext("the next leap year will be in %{year}", year: y),
      else: next_leap_msg(y + 1)
  end

  defp get_season(month) do
    cond do
      month in ~w(december january february)  -> "winter"
      month in ~w(march april may)            -> "spring"
      month in ~w(june july august)           -> "summer"
      month in ~w(september october november) -> "autumn"
    end
  end

  # Gettext
  defp gettext_value(value), do: Gettext.gettext(DateDisplayWeb.Gettext, value)
end
