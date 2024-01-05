defmodule FinanceiroApp.Dashboard.Installment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "installments" do
    field :value, :decimal
    field :date, :utc_datetime
    field :purchase_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(installment, attrs) do
    installment
    |> cast(attrs, [:date, :value])
    |> validate_required([:date, :value])
  end
end
