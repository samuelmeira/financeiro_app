defmodule FinanceiroApp.Repo.Migrations.CreateInstallments do
  use Ecto.Migration

  def change do
    create table(:installments) do
      add :date, :utc_datetime
      add :value, :decimal
      add :purchase_id, references(:purchases, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:installments, [:purchase_id])
  end
end
