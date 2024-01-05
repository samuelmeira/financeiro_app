defmodule FinanceiroApp.Repo.Migrations.CreatePurchases do
  use Ecto.Migration

  def change do
    create table(:purchases) do
      add :title, :string
      add :date, :utc_datetime
      add :total_value, :decimal
      add :total_installments, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:purchases, [:user_id])
  end
end
