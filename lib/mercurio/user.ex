defmodule Mercurio.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset
  alias Mercurio.{Room, File, Message}

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:email, :password, :name]

  @derive {Jason.Encoder, only: [:id, :email, :name]}

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :name, :string
    field :role, Ecto.Enum, values: [:admin, :external]

    belongs_to :files, File, foreign_key: :avatar_id
    has_many :messages, Message
    has_many :rooms, Room
    many_to_many :room_connected_users, Room, join_through: "room_connected_users"

    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
