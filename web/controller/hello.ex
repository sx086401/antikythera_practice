defmodule NewGear.Controller.Hello do
  use Antikythera.Controller

  def hello(conn) do
    NewGear.Gettext.put_locale(conn.request.query_params["locale"] || "en")
    Conn.render(conn, 200, "hello", [gear_name: :new_gear])
  end
end
