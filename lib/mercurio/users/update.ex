defmodule Mercurio.Users.Update do
  alias Mercurio.{Error, Repo, User}

  def call(%{"id" => id} = params) do
    IO.inspect(id)

    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> do_update(user, params)
    end
  end

  defp do_update(user, params) do
    with {:ok, %{:user_with_avatar => user_with_avatar}} <- update(user, params) do
      {:ok, user_with_avatar}
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end

  defp update(user, params) do
    Ecto.Multi.new()
    |> Ecto.Multi.update(:user, User.changeset(user, params))
    |> Ecto.Multi.update(:user_with_avatar, &User.avatar_changeset(&1.user, params))
    |> Repo.transaction()
  end
end
