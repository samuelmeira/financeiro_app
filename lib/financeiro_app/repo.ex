defmodule FinanceiroApp.Repo do
  use Ecto.Repo,
    otp_app: :financeiro_app,
    adapter: Ecto.Adapters.Postgres
end
