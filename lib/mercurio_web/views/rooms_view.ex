defmodule MercurioWeb.RoomsView do
  use MercurioWeb, :view
  alias Mercurio.Room

  def render("create.json", %{room: %Room{} = room}), do: room

  def render("show.json", %{room: %Room{} = room}), do: room

  def render("index.json", %{rooms: rooms}) do
    IO.inspect(%{rooms: Enum.map(rooms, &room_json/1)})

    %{rooms: Enum.map(rooms, &room_json/1)}
  end

  def room_json(room) do
    %{
      id: room.id,
      name: room.name,
      status: room.status,
      allow_gif: room.allow_gif,
      show_emoji_button: room.show_emoji_button,
      message_reactions: room.message_reactions,
      show_users_online: room.show_users_online,
      inserted_at: room.inserted_at,
      updated_at: room.updated_at
    }
  end
end
