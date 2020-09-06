defmodule AntikytheraPractice.Router do
  use Antikythera.Router

  get "/hello", Hello, :hello

  get "/books",         Book.Index, :get
  get "/book/:book_id", Book.Show,  :get
end
