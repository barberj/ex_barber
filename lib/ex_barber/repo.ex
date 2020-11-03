defmodule ExBarber.Repo do
  use Ecto.Repo,
    otp_app: :ex_barber,
    adapter: Ecto.Adapters.Postgres
end
