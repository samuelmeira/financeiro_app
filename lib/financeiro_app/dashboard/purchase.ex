defmodule FinanceiroApp.Dashboard.Purchase do
  use Ecto.Schema
  import Ecto.Changeset

  schema "purchases" do
    field :date, :utc_datetime
    field :title, :string
    field :total_value, :decimal
    field :total_installments, :integer
    field :user_id, :id

    has_many :installments, FinanceiroApp.Dashboard.Installment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(purchase, attrs) do
    purchase
    |> cast(attrs, [:title, :date, :total_value, :total_installments])
    |> validate_required([:title, :date, :total_value, :total_installments])
  end
end
