use Croma

defmodule AntikytheraPractice.Work.Book do
  use Ecto.Schema
  import Ecto.Changeset

  @timestamps_opts [type: :utc_datetime]

  schema "books" do
    field :title,               :string
    field :description,         :string, default: ""
    field :volume,              :integer

    timestamps()
  end

  defun changeset(book :: Schema.t, attrs :: v[map]) :: Changeset.t do
    book
    |> cast(attrs, [
      :title,
      :description,
      :volume,
    ])
    |> validate_required([:title])
  end
end
