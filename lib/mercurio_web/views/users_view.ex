defmodule MercurioWeb.UsersView do
  use MercurioWeb, :view

  alias Mercurio.User

  def render("create.json", %{token: token, user: %User{} = user}) do
    %{
      message: "User created!",
      token: token,
      user: user
    }
  end

  def render("sign_in.json", %{token: token, user: user}), do: %{token: token, user: user}

  def render("user.json", %{user: %User{} = user}), do: user
end
