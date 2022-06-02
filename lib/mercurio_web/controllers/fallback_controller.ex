defmodule MercurioWeb.FallbackController do
  use MercurioWeb, :controller

  alias Mercurio.Error
  alias MercurioWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
