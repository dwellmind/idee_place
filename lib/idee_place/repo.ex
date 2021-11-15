defmodule IdeePlace.Repo do
  use Ecto.Repo,
    otp_app: :idee_place,
    adapter: Ecto.Adapters.Postgres
end
