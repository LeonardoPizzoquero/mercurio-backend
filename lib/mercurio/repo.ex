defmodule Mercurio.Repo do
  use Ecto.Repo,
    otp_app: :mercurio,
    adapter: Ecto.Adapters.Postgres
end
