defmodule Mercurio.RoomConnectedUser do
  use Ecto.Schema
  import Ecto.Changeset

  alias Mercurio.{User, Room}

  @required_params [:room_id, :user_id]

  @derive {Jason.Encoder, only: [:id, :room_id, :user_id]}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "rooms" do
    belongs_to :user, User, foreign_key: :user_id
    belongs_to :room, Room, foreign_key: :room_id

    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
