defmodule MercurioWeb.WelcomeController do
  use MercurioWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> text("Welcome!")
    |> IO.inspect()
  end
end
