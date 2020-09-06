use Croma

defmodule AntikytheraPractice.Controller.Book.Index do
  use Antikythera.Controller

  defun get(%Conn{} = conn) :: Conn.t do
    Conn.json(conn, 200, %{})
  end
end
