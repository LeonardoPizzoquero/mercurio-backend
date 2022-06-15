defmodule Mercurio.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mercurio.{Room, User}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:content, :type, :user_id, :room_id]

  @cast_params [:content, :type, :fixed, :active, :likes, :user_id, :room_id]

  @types [:text, :gif]

  @derive {Jason.Encoder, only: [:id, :content, :fixed, :type]}

  schema "messages" do
    field :content, :string
    field :fixed, :boolean, default: false
    field :likes, :integer, default: 0
    field :type, Ecto.Enum, values: @types
    field :active, :boolean, default: true
    belongs_to :user, User, foreign_key: :user_id
    belongs_to :room, Room, foreign_key: :room_id

    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @cast_params)
    |> validate_inclusion(:type, @types)
    |> validate_required(@required_params)
  end
end
