defmodule DateDisplayWeb.FooterComponents do
  use Phoenix.Component
  use Gettext, backend: DateDisplayWeb.Gettext

  def lang_btns(assigns) do
    ~H"""
    <div id="lang-btns" class="space-x-0.5 font-space-grotesk">
      <%= for lang <- ~w(es en de) do %>
        <a href={"?lang=#{lang}"} class="border-[1.5px] border-[#3a3182] uppercase font-bold text-[0.8rem] pt-0.5 pb-px px-1.5 tracking-wider rounded-xs transition-colors duration-150"><%= lang %></a>
      <% end %>
    </div>
    """
  end

  def date_of_completion(assigns) do
    ~H"""
    <div class="font-inria-sans h-6 tracking-wide text-[0.89rem] cursor-pointer font-semibold">
      <u class="decoration-wavy underline-offset-2 decoration-1 decoration-[#6d77ee] hover:text-[#2a3182] hover:decoration-black transition-colors duration-150"><%= gettext("completed") %>: <time datetime="2026-09-19 13:30">dd-mm-yy</time></u>
    </div>
    """
  end
end
