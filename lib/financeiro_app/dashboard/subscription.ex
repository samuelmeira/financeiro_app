defmodule FinanceiroApp.Dashboard.Subscription do
  use Ecto.Schema
  import Ecto.Changeset
  alias FinanceiroApp.Accounts.User

  schema "subscriptions" do
    field :type, Ecto.Enum, values: [:home, :education, :electronics, :leisure, :restaurant, :health, :services, :grocery, :transportation, :clothing, :travel, :other]
    field :value, :decimal
    field :title, :string

    belongs_to(:user, User)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(subscription, attrs) do
    subscription
    |> cast(attrs, [:title, :value, :type, :user_id])
    |> validate_required([:title, :value, :type, :user_id])
  end
end
