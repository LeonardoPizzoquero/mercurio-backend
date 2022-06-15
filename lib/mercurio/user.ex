defmodule Mercurio.User do
  use Ecto.Schema
  use Waffle.Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset
  alias Mercurio.{Room, Message}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:email, :password, :name, :role]

  @roles [:admin, :user]

  @derive {Jason.Encoder, only: [:id, :email, :name, :role, :avatar]}

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :avatar_url, :string, virtual: true
    field :password_hash, :string
    field :name, :string
    field :role, Ecto.Enum, values: @roles
    field :avatar, Mercurio.FileImage.Type

    has_many :messages, Message
    has_many :rooms, Room

    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> cast_attachments(params, [:avatar])
    |> validate_inclusion(:role, @roles)
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
