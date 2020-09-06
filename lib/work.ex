use Croma

defmodule AntikytheraPractice.Work do
  alias AntikytheraAcs.Ecto.PostgresRepo, as: Repo
  alias AntikytheraPractice.Work.Book

  defun get_books() :: [map] do
    Book
    |> Repo.all()
  end

  defun create_book(params :: v[map] \\ %{}) :: {:ok, map | :error, any} do
    %Book{}
    |> Book.changeset(params)
    |> Repo.insert()
  end
end
