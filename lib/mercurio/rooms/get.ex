defmodule Mercurio.Rooms.Get do
  alias Mercurio.{Error, Repo, Room}

  def by_id(id) do
    case Repo.get(Room, id) do
      nil -> {:error, Error.build_room_not_found_error()}
      room -> {:ok, room}
    end
  end
end
