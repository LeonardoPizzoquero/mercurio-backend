defmodule Mercurio.Messages.Create do
  alias Mercurio.{Error, Repo, Message}

  def call(params) do
    changeset = Message.changeset(params)

    with {:ok, %Message{}} <- Message.build(changeset),
         {:ok, %Message{}} = user <- Repo.insert(changeset) do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end
end
