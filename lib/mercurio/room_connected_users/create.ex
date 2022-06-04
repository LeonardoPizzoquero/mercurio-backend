defmodule Mercurio.RoomConnectedUsers.Create do
  alias Mercurio.{Error, Repo, RoomConnectedUser}

  def call(params) do
    changeset = RoomConnectedUser.changeset(params)

    with {:ok, %RoomConnectedUser{}} <- RoomConnectedUser.build(changeset),
         {:ok, %RoomConnectedUser{}} = roomConnectedUser <- Repo.insert(changeset) do
      roomConnectedUser
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end
end
