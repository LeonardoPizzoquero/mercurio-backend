defmodule Mercurio do
  alias Mercurio.Users.Create, as: UserCreate
  alias Mercurio.Users.Delete, as: UserDelete
  alias Mercurio.Users.Get, as: UserGet
  alias Mercurio.Users.Update, as: UserUpdate

  alias Mercurio.Messages.Create, as: MessageCreate
  alias Mercurio.Messages.Delete, as: MessageDelete
  alias Mercurio.Messages.Get, as: MessageGet
  alias Mercurio.Messages.Update, as: MessageUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate update_user(params), to: UserUpdate, as: :call

  defdelegate create_message(params), to: MessageCreate, as: :call
  defdelegate delete_message(id), to: MessageDelete, as: :call
  defdelegate get_message_by_id(id), to: MessageGet, as: :by_id
  defdelegate update_message(params), to: MessageUpdate, as: :call
end
