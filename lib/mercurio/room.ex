defmodule Mercurio.Room do
  use Ecto.Schema
  import Ecto.Changeset

  alias Mercurio.{User}

  @required_params [:name, :user_id]
  @cast_params [:name, :status, :allow_gif, :show_emoji_button, :message_reactions, :show_users_online, :user_id]

  @derive {Jason.Encoder, only: [:id, :name, :status, :allow_gif, :show_emoji_button, :message_reactions, :show_users_online]}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "rooms" do
    field :name, :string
    field :status, :boolean, default: true
    field :allow_gif, :boolean, default: true
    field :show_emoji_button, :boolean, default: true
    field :message_reactions, :boolean, default: true
    field :show_users_online, :boolean, default: true

    belongs_to :user, User, foreign_key: :user_id

    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @cast_params)
    |> validate_required(@required_params)
  end
end
