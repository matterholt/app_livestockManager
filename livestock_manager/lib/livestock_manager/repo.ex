defmodule LivestockManager.Repo do
  use Ecto.Repo,
    otp_app: :livestock_manager,
    adapter: Ecto.Adapters.Postgres
end
