defmodule Mercurio.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_user_not_found_error, do: build(:not_found, "User not found")

  def build_user_not_found_admin_error, do: build(403, "Administrator not found")

  def build_message_not_found_error, do: build(:not_found, "Message not found")

  def build_room_not_found_error, do: build(:not_found, "Room not found")

  def build_rooms_not_found_error, do: build(:ok, [])
end
