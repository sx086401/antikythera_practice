defmodule AntikytheraPractice.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title,       :string, null: false
      add :description, :string
      add :volume,      :integer

      timestamps()
    end
  end
end
