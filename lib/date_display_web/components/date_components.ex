defmodule DateDisplayWeb.DateComponents do
  use Phoenix.Component

  attr :year, :boolean, default: false
  attr :segment, :string, default: nil

  def date_segment(assigns) do
    segment = if assigns.segment not in [nil, ""],
              do: assigns.segment,
              else: if(assigns.year, do: "0000", else: "00")

    assigns = assign(assigns, :segment, segment)

    ~H"""
    <div id="h1-wrapper" class={"relative [&:has(.hover-target:hover)>h1]:text-transparent [&:has(.hover-target:hover)>h1]:[-webkit-text-stroke:2px_black] #{@year && "mt-3.5"}"}>
      <div id="h1-hover-target" class="hover-target cursor-pointer absolute h-[4.5rem] -ml-1 bg-transparent top-1/2 -translate-y-1/2 left-1/2 -translate-x-1/2 z-1 border"></div>
      <h1 class="select-none cursor-default tracking-[0.4rem] font-bold text-8xl max-[725px]:text-[4.5rem]"><%= @segment %></h1>
    </div>
    """
  end


  def date_separator(assigns) do
    ~H"""
    <div class="separator px-1 max-[580px]:px-0 my-auto">
      <h1 class="select-none cursor-default separator tracking-[0.4rem] font-bold text-8xl max-[725px]:text-[4.5rem] -mt-3">-</h1>
    </div>
    """
  end
end
