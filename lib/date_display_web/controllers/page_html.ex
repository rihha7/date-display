defmodule DateDisplayWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use DateDisplayWeb, :html

  import DateDisplayWeb.IconComponents # leap_year_icon
  import DateDisplayWeb.LeapComponents # leap_year_info, next_leap_year
  use Gettext, backend: DateDisplayWeb.Gettext

  embed_templates "page_html/*"

  def leap_year_component(assigns) do
    ~H"""
    <section class="flex font-inria-sans tracking-widest font-semibold text-[0.9rem] max-[725px]:text-[0.875rem] items-center space-x-3 mx-auto w-fit -mt-0.75">

      <!-- next leap year -->
      <div class="relative group/tooltip1 [&:has(.hover-target:hover)>p>span]:underline">
      <p id="leap-year-question" class="cursor-pointer group select-none text-[1.05rem]/none max-[725px]:text-[0.9rem] py-1 max-[725px]:py-[2.5px]"><%= gettext("leap year?") %></p>
        <.next_leap_year next_leap_msg={@next_leap_year} />
      </div>

      <!-- is current year a leap year? --> 
      <div class={"group/tooltip2 relative
        #{if @is_leap_year, do: "[--circle-hover-fill:#9dd998]", else: "[--circle-hover-fill:#E89E99]"}
        [&:has(.hover-target:hover)>div:not(.hidden)>svg>circle]:fill-(--circle-hover-fill)"}>

        <.leap_year_icon is_leap={@is_leap_year} />
        <.leap_year_info leap_msg={@leap_year_msg} />
      </div>

    </section>
    """
  end
end
