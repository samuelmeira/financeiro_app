defmodule FinanceiroApp.Dashboard.Purchase do
  use Ecto.Schema
  import Ecto.Changeset
  alias FinanceiroApp.Accounts.User

  schema "purchases" do
    field :date, :utc_datetime
    field :title, :string
    field :total_value, :decimal
    field :total_installments, :integer

    has_many :installments, FinanceiroApp.Dashboard.Installment
    belongs_to(:user, User)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(purchase, attrs) do
    purchase
    |> cast(attrs, [:title, :date, :total_value, :total_installments, :user_id])
    |> validate_required([:title, :date, :total_value, :total_installments, :user_id])
  end
end
