defmodule Mercurio.Room do
  use Ecto.Schema
  import Ecto.Changeset

  alias Mercurio.{User}

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:name, :user_id]

  @derive {Jason.Encoder, only: [:id, :name, :status, :allow_gif, :show_emoji_button, :message_reactions, :show_users_online]}

  schema "rooms" do
    field :name, :string
    field :status, :boolean, default: true
    field :allow_gif, :boolean, default: true
    field :show_emoji_button, :boolean, default: true
    field :message_reactions, :boolean, default: true
    field :show_users_online, :boolean, default: true

    many_to_many :room_connected_users, User, join_through: "room_connected_users"

    belongs_to :user, User

    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
