defmodule MercurioWeb.MessagesView do
  use MercurioWeb, :view

  alias Mercurio.Message

  def render("create.json", %{message: %Message{} = message}), do: message

  def render("message.json", %{message: %Message{} = message}), do: message
end
