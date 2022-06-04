defmodule Mercurio.Messages.Delete do
  alias Mercurio.{Error, Repo, Message}

  def call(id) do
    case Repo.get(Message, id) do
      nil -> {:error, Error.build_message_not_found_error()}
      message -> Repo.delete(message)
    end
  end
end
