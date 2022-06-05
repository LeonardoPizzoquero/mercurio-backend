defmodule Mercurio.Rooms.GetAll do
  alias Mercurio.{Error, Repo, Room}

  def call() do
    case Repo.all(Room) do
      nil -> {:error, Error.build_rooms_not_found_error()}
      rooms -> {:ok, rooms}
    end
  end
end
