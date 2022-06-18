defmodule Mercurio.Users.Create do
  alias Mercurio.{Error, Repo, User}

  def call(params) do
    with {:ok, %{:user_with_avatar => user_with_avatar}} <- create_user(params) do
      {:ok, user_with_avatar}
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end

  def create_user(params) do
    Ecto.Multi.new()
    |> Ecto.Multi.insert(:user, User.changeset(params))
    |> Ecto.Multi.update(:user_with_avatar, &User.avatar_changeset(&1.user, params))
    |> Repo.transaction()
  end
end
