defmodule AntikytheraPractice.Controller.Hello do
  use Antikythera.Controller

  def hello(conn) do
    AntikytheraPractice.Gettext.put_locale(conn.request.query_params["locale"] || "en")
    Conn.render(conn, 200, "hello", [gear_name: :antikythera_practice])
  end
end
