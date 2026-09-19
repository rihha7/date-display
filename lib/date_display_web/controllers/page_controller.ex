defmodule DateDisplayWeb.PageController do
  use DateDisplayWeb, :controller

  @days_of_week ~w(monday tuesday wednesday thursday friday saturday sunday)
  @month ~w(january february march april may june july august september october november december)

  def home(conn, _params) do
    current = NaiveDateTime.local_now
    day_of_week = current |> NaiveDateTime.to_date |> Date.day_of_week
    day_of_week = @days_of_week |> Enum.at(day_of_week - 1) 
    month = @month |> Enum.at(current.month - 1)

    conn |> render(
      :home,
      day: gettext_value(day_of_week),
      date: pad(current.day, 2),
      month_name: gettext_value(month),
      month_numeric: pad(current.month, 2),
      year: pad(current.year, 4),

      season: gettext_value(month |> get_season),
      is_leap_year: current.year |> is_leap_year?,
      leap_year_msg: current.year |> leap_msg |> gettext_value,
      next_leap_year: current.year + 1 |> next_leap
    )
  end

  defp pad(n, lead), do: String.pad_leading("#{n}", lead, "0")

  defp is_leap_year?(y), do: (rem(y, 4) == 0 and rem(y, 100) != 0) or rem(y, 400) == 0

  defp leap_msg(y) do
    if is_leap_year?(y),
      do: gettext("%{year} is a leap year", year: y),
      else: gettext("%{year} is not a leap year", year: y)
  end

  defp next_leap(y) do
    if is_leap_year?(y),
      do: y,
      else: next_leap(y + 1)
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
