defmodule MercurioWeb.RoomsView do
  use MercurioWeb, :view

  alias Mercurio.Room

  def render("create.json", %{room: %Room{} = room}), do: room

  def render("room.json", %{room: %Room{} = room}), do: room
end
