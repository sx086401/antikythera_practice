defmodule AntikytheraPractice.RepoCase do
  use ExUnit.CaseTemplate

  alias AntikytheraAcs.Ecto.PostgresRepo, as: Repo
  setup do
    AntikytheraPractice.Ecto.prepare_repo()
    [
      AntikytheraPractice.Work.Book
    ]
    |> Enum.each(&Repo.delete_all/1)

    :ok
  end
end
