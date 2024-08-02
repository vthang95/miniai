defmodule Miniai.Repo do
  use Ecto.Repo,
    otp_app: :miniai,
    adapter: Ecto.Adapters.Postgres
end
