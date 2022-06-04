defmodule Mercurio.Rooms.Patch do
  import Ecto.Changeset
  alias Mercurio.{Error, Repo, Room}

  def call(%{"id" => id}) do
    case Repo.get(Room, id) do
      nil -> {:error, Error.build_room_not_found_error()}
      room -> do_update(room)
    end
  end

  defp do_update(room) do
    room
    |> do_update_status()
    |> Room.changeset()
    |> Repo.update()
  end

  defp do_update_status(room) do
    change(room, %{status: !room.status})
  end
end
