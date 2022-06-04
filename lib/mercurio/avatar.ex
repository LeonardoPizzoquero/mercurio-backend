defmodule Mercurio.Avatar do
  use Ecto.Schema
  import Ecto.Changeset

  alias Mercurio.{User}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:path, :name, :user_id]

  @derive {Jason.Encoder, only: [:id, :path, :name, :user_id]}

  schema "rooms" do
    field :path, :string
    field :name, :string

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
