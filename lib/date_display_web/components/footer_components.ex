defmodule DateDisplayWeb.FooterComponents do
  use Phoenix.Component

  def lang_btns(assigns) do
    ~H"""
    <div id="lang-btns" class="space-x-0.5 font-space-grotesk">
      <%= for lang <- ~w(es en de) do %>
        <a href="" class="border-[1.5px] border-[#3a3182] uppercase font-bold text-[0.8rem] pt-0.5 pb-px px-1.5 tracking-wider rounded-xs transition-colors duration-150"><%= lang %></a>
      <% end %>
    </div>
    """
  end
end
