defmodule MercurioWeb.UserSocket do
  use Phoenix.Socket

  alias MercurioWeb.Auth.Guardian

  channel "room:*", MercurioWeb.RoomChannel

  @impl true
  def connect(%{"token" => token}, socket) do
    case Guardian.decode_and_verify(token) do
      {:ok, claims} ->
        case Guardian.resource_from_claims(claims) do
          {:ok, user} ->
            {:ok, assign(socket, :current_user, user)}
          {:error, _reason} ->
            :error
        end
      {:error, _reason} ->
        :error
    end
  end

  @impl true
  def id(_socket), do: nil
end
