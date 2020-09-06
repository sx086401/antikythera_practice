defmodule AntikytheraPractice.WorkTest do
  use AntikytheraPractice.RepoCase

  alias AntikytheraPractice.Work

  describe "get_books/0" do
    setup do
      work = Work.create_book(%{title: "test"})

      [work: work]
    end

    test "returns works successfully", %{work: work} do
      res = Work.get_books()

      assert length(res) == 1
      assert res |> hd() |> Map.get(:id) == work.id
    end
  end
end
