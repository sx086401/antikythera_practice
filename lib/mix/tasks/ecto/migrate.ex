use Croma

defmodule Mix.Tasks.AntikytheraPractice.Ecto.Migrate do
  @moduledoc """
  Usage: `Antikythera_Practice_CONFIG_JSON=$(< gear_config.json) mix antikythera_practice.ecto.migrate`

  Runs the pending migrations.
  """

  use Mix.Task

  alias AntikytheraAcs.Ecto.PostgresRepo, as: Repo

  def run([]) do
    Logger.App.stop() # To restart Logger with application's config
    :ok = Antikythera.Mix.Task.prepare_antikythera_instance()
    Logger.App.start()

    execute()

    IO.puts("Done")
  end

  def execute() do
    execute_impl("priv/repo/migrations")
  end

  defunpt execute_impl(path :: v[String.t]) :: [integer] do
    {:ok, pid} = AntikytheraPractice.Ecto.prepare_repo()

    opts = [all: true, dynamic_repo: pid]
    path = Path.join(File.cwd!(), path)

    Ecto.Migrator.run(Repo, path, :up, opts)
  end
end
