use Croma

defmodule AntikytheraPractice.Controller.Book.Show do
  use Antikythera.Controller

  alias AntikytheraPractice.Error

  defmodule PathMatch do
    use Croma.Struct, recursive_new?: true, fields: [
      book_id: Croma.NonNegInteger
    ]
  end

  defun get(%Conn{request: %{path_matches: path_matches}} = conn) :: Conn.t do
    case PathMatch.new(path_matches) do
      {:ok, %{book_id: _book_id}} ->
        Conn.json(conn, 200, %{})
      {:error, _} ->
        Conn.json(conn, 400, Error.BadRequest.new())
    end
  end
end
