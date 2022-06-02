defmodule Mercurio.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mercurio.{Room, User}

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:content, :type]

  @derive {Jason.Encoder, only: [:id, :content, :fixed, :type]}

  schema "messages" do
    field :content, :string
    field :fixed, :boolean, default: false
    field :type, :string
    field :active, :boolean, default: true
    belongs_to :users, User
    belongs_to :rooms, Room

    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
