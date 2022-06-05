defmodule MercurioWeb.RoomsController do
  use MercurioWeb, :controller

  alias Mercurio.Room
  alias MercurioWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    with {:ok, rooms} <- Mercurio.get_all_rooms() do
      conn
      |> put_status(:ok)
      |> render("index.json", rooms: rooms)
    end
  end

  def create(conn, params) do
    with {:ok, %Room{} = room} <- Mercurio.create_room(params) do
      conn
      |> put_status(:created)
      |> render("create.json", room: room)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Room{} = room} <- Mercurio.get_room_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("room.json", room: room)
    end
  end

  def update(conn, params) do
    with {:ok, %Room{} = room} <- Mercurio.update_room(params) do
      conn
      |> put_status(:ok)
      |> render("room.json", room: room)
    end
  end

  def change_status(conn, %{"id" => id}) do
    with {:ok, %Room{}} <- Mercurio.change_room_status(id) do
      conn
      |> put_status(:ok)
      |> text("")
    end
  end
end
