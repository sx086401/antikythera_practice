use Croma

defmodule Mix.Tasks.AntikytheraPractice.Ecto.Drop do
  @moduledoc """
  Usage: `Antikythera_Practice_CONFIG_JSON=$(< gear_config.json) mix antikythera_practice.ecto.drop`

  Drops DB.
  """

  use Mix.Task

  alias AntikytheraAcs.Ecto.PostgresRepo, as: Repo

  def run([]) do
    :ok = Antikythera.Mix.Task.prepare_antikythera_instance()

    case execute() do
      :ok ->
        Mix.shell().info "The database for #{inspect Repo} has been dropped"
      {:error, :already_down} ->
        Mix.shell().info "The database for #{inspect Repo} has already been dropped"
    end
  end

  def execute() do
    config = AntikytheraPractice.Ecto.repo_config()
    Repo.__adapter__().storage_down(config)
  end
end
