defmodule Mercurio.Users.IsAdmin do
  import Ecto.Query
  alias Mercurio.{Error, Repo, User}

  def is_admin(email) do
    query = from u in User, where: [email: ^email], where: [role: :admin]

    case Repo.all(query) do
      [] -> {:error, Error.build_user_not_found_admin_error()}
      user -> {:ok, user}
    end
  end
end
