alias Mix.Tasks.AntikytheraPractice.Ecto

Antikythera.Test.Config.init()
Ecto.Create.execute()
Ecto.Migrate.execute()

defmodule Req do
  use Antikythera.Test.HttpClient
end

defmodule Socket do
  use Antikythera.Test.WebsocketClient
end

["test/repo_case.exs"]
|> Enum.flat_map(&Path.wildcard/1)
|> Enum.each(&Code.load_file/1)
