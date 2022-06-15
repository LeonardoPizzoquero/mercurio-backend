defmodule MercurioWeb.UsersView do
  use MercurioWeb, :view

  alias Mercurio.{User, FileImage}

  def render("create.json", %{token: token, user: %User{} = user}) do
    %{
      message: "User created!",
      token: token,
      user: user_json(user)
    }
  end

  def render("sign_in.json", %{token: token, user: user}),
    do: %{token: token, user: user_json(user)}

  def render("user.json", %{user: %User{} = user}), do: user_json(user)

  def user_json(user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      role: user.role,
      avatar: render_avatar_url(user),
      inserted_at: user.inserted_at,
      updated_at: user.updated_at
    }
  end

  def render_avatar_url(user) do
    case user.avatar do
      nil -> nil
      avatar -> FileImage.url({avatar.file_name, user}, :original)
    end
  end
end
