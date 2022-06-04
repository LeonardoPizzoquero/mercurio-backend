defmodule Mercurio.Messages.Update do
  alias Mercurio.{Error, Repo, Message}

  def call(%{"id" => id} = params) do
    case Repo.get(Message, id) do
      nil -> {:error, Error.build_message_not_found_error()}
      message -> do_update(message, params)
    end
  end

  defp do_update(message, params) do
    message
    |> Message.changeset(params)
    |> Repo.update()
  end
end
