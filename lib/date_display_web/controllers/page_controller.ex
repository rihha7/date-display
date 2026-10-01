defmodule DateDisplayWeb.PageController do
  use DateDisplayWeb, :controller
  
  def home(conn, _params) do
    local = NaiveDateTime.local_now()

    day_index = local |> NaiveDateTime.to_date |> Date.day_of_week()
    month = local.month

    conn |> render(
      :home,
      day: day_index |> get_day_of_week(),
      date: pad(local.day, 2), # |> dbg(),
      month_name: month |> get_month(),
      month_numeric: pad(month, 2),
      year: pad(local.year, 4),

      season: month |> get_season(),
      is_leap_year: local.year |> is_leap_year?(),
      leap_year_msg: local.year |> leap_msg(),
      next_leap_year: local.year + 1 |> next_leap_msg()
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

  defp get_season(month) when month in [12, 1, 2],  do: gettext("winter")
  defp get_season(month) when month in [3, 4, 5],   do: gettext("spring")
  defp get_season(month) when month in [6, 7, 8],   do: gettext("summer")
  defp get_season(month) when month in [9, 10, 11], do: gettext("autumn")


  defp get_day_of_week(1), do: gettext("monday")
  defp get_day_of_week(2), do: gettext("tuesday")
  defp get_day_of_week(3), do: gettext("wednesday")
  defp get_day_of_week(4), do: gettext("thursday")
  defp get_day_of_week(5), do: gettext("friday")
  defp get_day_of_week(6), do: gettext("saturday")
  defp get_day_of_week(7), do: gettext("sunday")


  defp get_month(1), do: gettext("january")
  defp get_month(2), do: gettext("february")
  defp get_month(3), do: gettext("march")
  defp get_month(4), do: gettext("april")
  defp get_month(5), do: gettext("may")
  defp get_month(6), do: gettext("june")
  defp get_month(7), do: gettext("july")
  defp get_month(8), do: gettext("august")
  defp get_month(9), do: gettext("september")
  defp get_month(10), do: gettext("october")
  defp get_month(11), do: gettext("november")
  defp get_month(12), do: gettext("december")
end
