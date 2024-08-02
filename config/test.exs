import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :miniai, Miniai.Repo,
  username: "guest",
  password: "guest",
  hostname: "localhost",
  port: "5324",
  database: "miniai_db",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :miniai, MiniaiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "bsIt8c1ycreJPtb9hDtkmgiNi7r63M/hSHoL7EMHeEYJBazTaEhS8UYfrM8fhV8X",
  server: false

# In test we don't send emails
config :miniai, Miniai.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
