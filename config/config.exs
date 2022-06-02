# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :mercurio,
  ecto_repos: [Mercurio.Repo]

config :mercurio, Mercurio.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :mercurio, MercurioWeb.Auth.Guardian,
  issuer: "mercurio",
  secret_key: "np91Hq8v6+eHWETq8KhYOc10QjCdWCmf7N5V1e/OJ+QY+l/t8B8N20x4xjcXLEwL"

config :mercurio, MercurioWeb.Auth.Pipeline,
  module: MercurioWeb.Auth.Guardian,
  error_handler: MercurioWeb.Auth.ErrorHandler

# Configures the endpoint
config :mercurio, MercurioWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dFdujrx1D52Vzzxqnp9DAHf/uiUUdJhvdgOmc8DU6Ou1FwFA41Wk+xVn/AhufHpa",
  render_errors: [view: MercurioWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Mercurio.PubSub,
  live_view: [signing_salt: "0FF26Bkc"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :mercurio, Mercurio.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
