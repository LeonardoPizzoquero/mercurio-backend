defmodule MercurioWeb.RoomChannel do
  use MercurioWeb, :channel
  alias MercurioWeb.Presence

  @impl true
  def join("room:" <> room_id,  %{"name" => name}, socket) do
    send(self(), {:after_join, :name, name})

    {:ok, room_id, socket}
  end

  @impl true
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  @impl true
  def handle_in("message", %{"body" => body}, socket) do
    broadcast!(socket, "message", %{body: body})

    {:noreply, socket}
  end

  @impl true
  def handle_info(:after_join, socket) do
    %{name: name, id: id} = socket.assigns.current_user

    {:ok, _} = Presence.track(socket, id, %{
      online_at: inspect(System.system_time(:second)),
      name: name,
      id: id
    })

    push(socket, "presence_state", Presence.list(socket))

    {:noreply, socket}
  end
end
