defmodule Mercurio.Messages.Get do
  alias Mercurio.{Error, Repo, Message}

  def by_id(id) do
    case Repo.get(Message, id) do
      nil -> {:error, Error.build_message_not_found_error()}
      message -> {:ok, message}
    end
  end
end
