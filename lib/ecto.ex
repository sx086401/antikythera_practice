use Croma

defmodule AntikytheraPractice.Ecto do
  require AntikytheraAcs.Ecto
  alias AntikytheraAcs.Ecto.PostgresRepo

  @epool_id {:gear, :antikythera_practice}

  defun prepare_repo() :: {:ok, pid | :error, any} do
    %{
      "hostname" => hostname,
      "database" => database,
      "username" => username,
      "password" => password,
      "ssl"      => ssl,
    } = AntikytheraPractice.get_all_env()
    options = [username: username, password: password, ssl: ssl]
    AntikytheraAcs.Ecto.put_or_start_repo(@epool_id, hostname, database, PostgresRepo, options)
  end

  defun repo_config() :: Keyword.t do
    %{
      "hostname" => hostname,
      "database" => database,
      "username" => username,
      "password" => password,
      "ssl"      => ssl,
    } = AntikytheraPractice.get_all_env()
    [
      hostname: hostname,
      database: database,
      username: username,
      password: password,
      ssl:      ssl,
    ]
  end
end
