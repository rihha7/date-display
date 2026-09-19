# use a plug to read the locale param/cookie
defmodule DateDisplayWeb.Plugs.SetLocale do
  def init(opts), do: opts

  def call(conn, _opts) do
    locale = conn.params["lang"] || "en"
    Gettext.put_locale(DateDisplayWeb.Gettext, locale)
    conn
  end
end
