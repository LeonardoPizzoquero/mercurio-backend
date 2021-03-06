defmodule MercurioWeb.UsersController do
  use MercurioWeb, :controller

  alias MercurioWeb.Auth.Guardian

  alias Mercurio.User
  alias MercurioWeb.{Auth.Guardian, FallbackController}

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Mercurio.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user, %{}) do
      conn
      |> put_status(:created)
      |> render("create.json", token: token, user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- Mercurio.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Mercurio.get_user_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def sign_in(conn, params) do
    with {:ok, token, user} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token, user: user)
    end
  end

  def sign_in_admin(conn, %{"email" => email} = params) do
    with {:ok, _users} <- Mercurio.verify_user_admin(email),
         {:ok, token, user} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token, user: user)
    end
  end

  def update(conn, params) do
    current_claims = Guardian.Plug.current_claims(conn)

    with {:ok, %User{} = user} <-
           Mercurio.update_user(Map.put(params, "id", Map.get(current_claims, "sub"))) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end
end
