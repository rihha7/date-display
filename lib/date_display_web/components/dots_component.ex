defmodule DateDisplayWeb.DotsComponent do
  use Phoenix.Component

  attr :bg_colour, :string, default: "transparent"
  attr :count, :integer, default: 0
  attr :top_left, :boolean, default: false
  attr :bottom_right, :boolean, default: false

  def render_dots(assigns) do
    ~H"""
    <section class={["absolute",
      @top_left && "top-10 left-7 lg:left-10 max-[570px]:left-3",
      @bottom_right && "bottom-12 right-7 lg:right-10 max-[570px]:right-4",
      "max-[570px]:bottom-0", "max-[570px]:h-min", "max-[570px]:top-2", "max-[570px]:flex"
    ]}>
      <%= for _ <- 1..@count do %>
        <div class={"#{@bg_colour} w-1.5 h-1.5 border-[1.5px] border-black rounded-full my-4 max-[870px]:my-3.5 max-[570px]:mx-1.75"}></div>
      <% end %>
    </section>
    """
  end
end
