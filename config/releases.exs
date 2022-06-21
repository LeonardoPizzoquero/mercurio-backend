import Config

config :mercurio, MercurioWeb.Endpoint,
  server: true,
  # Needed for Phoenix 1.2 and 1.4. Doesn't hurt for 1.3.
  http: [port: {:system, "PORT"}],
  check_origin: false,
  url: [host: System.get_env("APP_NAME") <> ".gigalixirapp.com", port: 443]
