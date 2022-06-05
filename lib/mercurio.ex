defmodule Mercurio do
  alias Mercurio.Users.Create, as: UserCreate
  alias Mercurio.Users.Delete, as: UserDelete
  alias Mercurio.Users.Get, as: UserGet
  alias Mercurio.Users.Update, as: UserUpdate
  alias Mercurio.Users.IsAdmin, as: UserIsAdmin

  alias Mercurio.Messages.Create, as: MessageCreate
  alias Mercurio.Messages.Delete, as: MessageDelete
  alias Mercurio.Messages.Get, as: MessageGet
  alias Mercurio.Messages.Update, as: MessageUpdate

  alias Mercurio.Rooms.Create, as: RoomCreate
  alias Mercurio.Rooms.PatchStatus, as: RoomChangeStatus
  alias Mercurio.Rooms.Get, as: RoomGet
  alias Mercurio.Rooms.GetAll, as: RoomGetAll
  alias Mercurio.Rooms.Update, as: RoomUpdate

  alias Mercurio.RoomConnectedUsers.Create, as: RoomConnectedUserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate update_user(params), to: UserUpdate, as: :call
  defdelegate verify_user_admin(params), to: UserIsAdmin, as: :is_admin

  defdelegate create_message(params), to: MessageCreate, as: :call
  defdelegate delete_message(id), to: MessageDelete, as: :call
  defdelegate get_message_by_id(id), to: MessageGet, as: :by_id
  defdelegate update_message(params), to: MessageUpdate, as: :call

  defdelegate create_room(params), to: RoomCreate, as: :call
  defdelegate change_room_status(id), to: RoomChangeStatus, as: :call
  defdelegate get_room_by_id(id), to: RoomGet, as: :by_id
  defdelegate get_all_rooms(), to: RoomGetAll, as: :call
  defdelegate update_room(params), to: RoomUpdate, as: :call

  defdelegate create_room_connection(params), to: RoomConnectedUserCreate, as: :call
end
