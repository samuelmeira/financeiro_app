defmodule FinanceiroApp.Dashboard.Installment do
  use Ecto.Schema
  import Ecto.Changeset
  alias FinanceiroApp.Dashboard.Purchase

  schema "installments" do
    field :value, :decimal
    field :date, :utc_datetime

    belongs_to(:purchase, Purchase)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(installment, attrs) do
    installment
    |> cast(attrs, [:date, :value, :purchase_id])
    |> validate_required([:date, :value, :purchase_id])
  end
end
