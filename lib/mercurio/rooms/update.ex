defmodule Mercurio.Rooms.Update do
  alias Mercurio.{Error, Repo, Room}

  def call(%{"id" => id} = params) do
    case Repo.get(Room, id) do
      nil -> {:error, Error.build_room_not_found_error()}
      room -> do_update(room, params)
    end
  end

  defp do_update(room, params) do
    room
    |> Room.changeset(params)
    |> Repo.update()
  end
end
