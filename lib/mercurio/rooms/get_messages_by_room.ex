defmodule Mercurio.Rooms.GetMessagesByRoom do
  import Ecto.Query, only: [from: 2]

  alias Mercurio.{Repo, Message}

  def call(id) do
    query = from m in Message,
          join: u in assoc(m, :user),
          where: m.room_id == ^id,
          order_by: [asc: :inserted_at],
          select: %{
            id: m.id,
            content: m.content,
            type: m.type,
            active: m.active,
            likes: m.likes,
            user: %{
              name: u.name,
              id: u.id,
              email: u.email,
              role: u.role
            },
            fixed: m.fixed,
            inserted_at: m.inserted_at,
          }

    case Repo.all(query) do
      messages -> {:ok, messages}
    end
  end
end
