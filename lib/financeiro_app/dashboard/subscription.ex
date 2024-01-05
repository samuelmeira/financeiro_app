defmodule FinanceiroApp.Dashboard.Subscription do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subscriptions" do
    field :type, Ecto.Enum, values: [:home, :education, :electronics, :leisure, :restaurant, :health, :services, :grocery, :transportation, :clothing, :travel, :other]
    field :value, :decimal
    field :title, :string
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(subscription, attrs) do
    subscription
    |> cast(attrs, [:title, :value, :type])
    |> validate_required([:title, :value, :type])
  end
end
