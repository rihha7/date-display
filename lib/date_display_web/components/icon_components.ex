defmodule DateDisplayWeb.IconComponents do
  use Phoenix.Component  

  attr :is_leap, :boolean, default: false

  def leap_year_icon(assigns) do
    ~H"""
    <div class={["select-none", "cursor-pointer"]}>
      <svg class="[&:has(*:hover)>circle]:fill-(--circle-hover-fill)" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">

        <%= if @is_leap do %>
          <circle class="is_leap_year" cx="10" cy="10" r="9.5" fill="#aff7a8" stroke="black"/>
          <text class="is_leap_year" x="10.9" y="14" text-anchor="middle" font-size="0.68rem" fill="black">✔</text>

        <% else %>
          <circle class="not_leap_year" cx="10" cy="10" r="9.5" fill="#f7ada8" stroke="black"/>
          <path class="not_leap_year" d="M12.9999 7L7 12.9999" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
          <path class="not_leap_year" d="M7.0001 7L13 12.9999" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
        <% end %>
      </svg>

    </div>
    """
  end

end
