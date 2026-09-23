defmodule DateDisplayWeb.LeapComponents do
  use Phoenix.Component


  attr :leap_msg, :string, default: "no leap info msg"

  def leap_year_info(assigns) do
    ~H"""
    <div id="leap-year-info" class="hover-target hidden
      bg-(--circle-hover-fill)/70
      group-hover/tooltip2:block
      before:h-3.5 before:w-20 before:left-1/2 before:-translate-x-1/2 before:bottom-full before:absolute max-[640px]:before:translate-x-0
                   absolute py-0.5 border rounded-sm whitespace-nowrap tracking-wider font-medium px-2 -translate-x-1/2 left-1/2 mt-3 text-center max-[640px]:text-[0.855rem] max-[640px]:pt-[2.8px] max-[640px]:-translate-x-4/5">
      <%= @leap_msg %>
    </div>
    """
  end



  attr :next_leap_msg, :string, default: "no next leap year msg"

  def next_leap_year(assigns) do
    ~H"""
    <div id="next-leap-year" class="hover-target hidden
                   bg-linear-to-r from-[#ABE9DE] to-[#F8B9D2]
                   group-hover/tooltip1:block
                   before:h-3 before:w-20 before:left-1/2 before:-translate-x-1/2 before:bottom-full before:absolute
                   absolute py-0.5 border rounded-sm whitespace-nowrap tracking-wider font-medium px-2 -translate-x-1/2 left-1/2 mt-3 text-center select-none">

      <span class="max-[614px]:hidden">❯❯</span>
      <span id="next-leap" class="select-all inline-block mx-1">
        <%= @next_leap_msg %>
      </span>
      <span class="max-[614px]:hidden">❯❯</span>
    </div>
    """
  end
end
