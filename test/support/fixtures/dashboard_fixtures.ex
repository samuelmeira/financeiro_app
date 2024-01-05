defmodule FinanceiroApp.DashboardFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FinanceiroApp.Dashboard` context.
  """

  @doc """
  Generate a subscription.
  """
  def subscription_fixture(attrs \\ %{}) do
    {:ok, subscription} =
      attrs
      |> Enum.into(%{
        title: "some title",
        type: :home,
        value: "120.5"
      })
      |> FinanceiroApp.Dashboard.create_subscription()

    subscription
  end

  @doc """
  Generate a purchase.
  """
  def purchase_fixture(attrs \\ %{}) do
    {:ok, purchase} =
      attrs
      |> Enum.into(%{
        date: ~U[2024-01-04 03:56:00Z],
        installments: 42,
        title: "some title",
        total_value: "120.5"
      })
      |> FinanceiroApp.Dashboard.create_purchase()

    purchase
  end

  @doc """
  Generate a installment.
  """
  def installment_fixture(attrs \\ %{}) do
    {:ok, installment} =
      attrs
      |> Enum.into(%{
        date: ~U[2024-01-04 04:01:00Z],
        value: "120.5"
      })
      |> FinanceiroApp.Dashboard.create_installment()

    installment
  end
end
