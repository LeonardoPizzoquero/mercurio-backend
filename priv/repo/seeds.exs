# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Mercurio.Repo.insert!(%Mercurio.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Mercurio.{User, Repo}

user = %User{
  email: "administrator@mercurio.com",
  name: "Administrator",
  password: "4012788f32a749e01d104951d92d0723",
  role: "admin"
}

Repo.insert!(user)
