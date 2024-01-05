defmodule FinanceiroApp.Repo.Migrations.CreateSubscriptions do
  use Ecto.Migration

  def change do
    create table(:subscriptions) do
      add :title, :string
      add :value, :decimal
      add :type, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:subscriptions, [:user_id])
  end
end
