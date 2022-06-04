defmodule Mercurio.Rooms.Create do
  alias Mercurio.{Error, Repo, Room}

  def call(params) do
    changeset = Room.changeset(params)

    with {:ok, %Room{}} <- Room.build(changeset),
         {:ok, %Room{}} = room <- Repo.insert(changeset) do
      room
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end
end
