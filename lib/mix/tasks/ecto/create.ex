use Croma

defmodule Mix.Tasks.AntikytheraPractice.Ecto.Create do
  @moduledoc """
  Usage: `Antikythera_Practice_CONFIG_JSON=$(< gear_config.json) mix antikythera_practice.ecto.create`

  Creates DB.
  """

  use Mix.Task

  alias AntikytheraAcs.Ecto.PostgresRepo, as: Repo

  def run([]) do
    :ok = Antikythera.Mix.Task.prepare_antikythera_instance()

    case execute() do
      :ok ->
        Mix.shell().info "The database for #{inspect Repo} has been created"
      {:error, :already_up} ->
        Mix.shell().info "The database for #{inspect Repo} has already been created"
    end
  end

  def execute() do
    config = AntikytheraPractice.Ecto.repo_config()
    Repo.__adapter__().storage_up(config)
  end
end
