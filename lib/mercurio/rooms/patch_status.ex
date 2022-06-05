defmodule Mercurio.Rooms.PatchStatus do
  alias Mercurio.{Error, Repo, Room}

  def call(id) do
    case Repo.get(Room, id) do
      nil -> {:error, Error.build_room_not_found_error()}
      room -> do_update(room)
    end
  end

  defp do_update(room) do
    room
    |> Room.changeset(%{status: !room.status})
    |> Repo.update()
  end
end
