defmodule MercurioWeb.RoomChannel do
  use MercurioWeb, :channel
  alias MercurioWeb.Presence

  @impl true
  def join("room:" <> room_id, _payload, socket) do
    send(self(), :after_join)

    case Mercurio.get_room_by_id(room_id) do
      {:ok, room} ->
      socket = assign(socket, :room, room)

      response = %{room: room}

      {:ok, response, socket}

      {:error, _reason} -> {:error, %{reason: "Room not found"}}
    end
  end

  @impl true
  def handle_info(:after_join, socket) do
    %{name: name, id: id} = socket.assigns.current_user
    %{id: room_id} = socket.assigns.room

    {:ok, _} = Presence.track(socket, id, %{
      online_at: inspect(System.system_time(:second)),
      name: name
    })

    push(socket, "presence_state", Presence.list(socket))

    {:ok, messages} = Mercurio.get_room_messages(room_id)

    messages
    |> Enum.each(fn message -> push(socket, "message", message) end)

    {:noreply, socket}
  end

  @impl true
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  @impl true
  def handle_in("message", payload, socket) do
    %{name: name, id: id, email: email, role: role} = socket.assigns.current_user
    %{"content" => content, "type" => type} = payload

    spawn(fn -> Mercurio.create_message(payload) end)

    message = %{
      id: "",
      content: content,
      type: type,
      active: true,
      likes: 0,
      user: %{
        name: name,
        id: id,
        email: email,
        role: role
      },
      fixed: false,
      inserted_at: :os.system_time(:millisecond),
    }

    broadcast!(socket, "message", message)

    {:noreply, socket}
  end
end
