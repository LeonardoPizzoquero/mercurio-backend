defmodule MercurioWeb.MessagesController do
  use MercurioWeb, :controller

  alias Mercurio.Message
  alias MercurioWeb.{FallbackController}

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Message{} = message} <- Mercurio.create_message(params) do
      conn
      |> put_status(:created)
      |> render("create.json", message: message)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Message{}} <- Mercurio.delete_message(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Message{} = message} <- Mercurio.get_message_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("message.json", message: message)
    end
  end

  def update(conn, params) do
    with {:ok, %Message{} = message} <- Mercurio.update_message(params) do
      conn
      |> put_status(:ok)
      |> render("message.json", message: message)
    end
  end
end
