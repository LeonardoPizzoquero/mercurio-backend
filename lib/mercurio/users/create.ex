defmodule Mercurio.Users.Create do
  alias Mercurio.{Error, Repo, User}

  def call(params) do
    changeset = User.changeset(Map.put(params, "role", "user"))

    with {:ok, %User{}} <- User.build(changeset),
         {:ok, %User{}} = user <- Repo.insert(changeset) do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end
end
