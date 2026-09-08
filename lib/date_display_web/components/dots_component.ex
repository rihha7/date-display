defmodule DateDisplayWeb.DotsComponent do
  use Phoenix.Component

  attr :bg_colour, :string, default: "transparent"
  attr :count, :integer, default: 0
  attr :top_left, :boolean, default: false
  attr :bottom_right, :boolean, default: false

  def render_dots(assigns) do
    # old:
    # @top_left && "top-16 lg:top-21 left-7 lg:left-10",
    # @bottom_right && "bottom-17 lg:bottom-22 right-7 lg:right-10",

    ~H"""
    <section class={["absolute",
      @top_left && "top-14 left-7 lg:left-10",
      @bottom_right && "bottom-13 right-7 lg:right-10",
    ]}>
      <%= for _ <- 1..@count do %>
        <div class={"#{@bg_colour} w-[6px] h-[6px] border-[1.5px] border-black rounded-full my-4"}></div>
      <% end %>
    </section>
    """
  end
end
