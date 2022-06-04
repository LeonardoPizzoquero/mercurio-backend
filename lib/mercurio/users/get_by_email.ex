defmodule Mercurio.Users.GetByEmail do
  alias Mercurio.{Error, Repo, User}

  def by_email(email) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
