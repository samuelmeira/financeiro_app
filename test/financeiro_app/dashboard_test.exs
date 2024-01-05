defmodule FinanceiroApp.DashboardTest do
  use FinanceiroApp.DataCase

  alias FinanceiroApp.Dashboard

  describe "subscriptions" do
    alias FinanceiroApp.Dashboard.Subscription

    import FinanceiroApp.DashboardFixtures

    @invalid_attrs %{type: nil, value: nil, title: nil}

    test "list_subscriptions/0 returns all subscriptions" do
      subscription = subscription_fixture()
      assert Dashboard.list_subscriptions() == [subscription]
    end

    test "get_subscription!/1 returns the subscription with given id" do
      subscription = subscription_fixture()
      assert Dashboard.get_subscription!(subscription.id) == subscription
    end

    test "create_subscription/1 with valid data creates a subscription" do
      valid_attrs = %{type: :home, value: "120.5", title: "some title"}

      assert {:ok, %Subscription{} = subscription} = Dashboard.create_subscription(valid_attrs)
      assert subscription.type == :home
      assert subscription.value == Decimal.new("120.5")
      assert subscription.title == "some title"
    end

    test "create_subscription/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dashboard.create_subscription(@invalid_attrs)
    end

    test "update_subscription/2 with valid data updates the subscription" do
      subscription = subscription_fixture()
      update_attrs = %{type: :education, value: "456.7", title: "some updated title"}

      assert {:ok, %Subscription{} = subscription} = Dashboard.update_subscription(subscription, update_attrs)
      assert subscription.type == :education
      assert subscription.value == Decimal.new("456.7")
      assert subscription.title == "some updated title"
    end

    test "update_subscription/2 with invalid data returns error changeset" do
      subscription = subscription_fixture()
      assert {:error, %Ecto.Changeset{}} = Dashboard.update_subscription(subscription, @invalid_attrs)
      assert subscription == Dashboard.get_subscription!(subscription.id)
    end

    test "delete_subscription/1 deletes the subscription" do
      subscription = subscription_fixture()
      assert {:ok, %Subscription{}} = Dashboard.delete_subscription(subscription)
      assert_raise Ecto.NoResultsError, fn -> Dashboard.get_subscription!(subscription.id) end
    end

    test "change_subscription/1 returns a subscription changeset" do
      subscription = subscription_fixture()
      assert %Ecto.Changeset{} = Dashboard.change_subscription(subscription)
    end
  end

  describe "purchases" do
    alias FinanceiroApp.Dashboard.Purchase

    import FinanceiroApp.DashboardFixtures

    @invalid_attrs %{date: nil, title: nil, total_value: nil, installments: nil}

    test "list_purchases/0 returns all purchases" do
      purchase = purchase_fixture()
      assert Dashboard.list_purchases() == [purchase]
    end

    test "get_purchase!/1 returns the purchase with given id" do
      purchase = purchase_fixture()
      assert Dashboard.get_purchase!(purchase.id) == purchase
    end

    test "create_purchase/1 with valid data creates a purchase" do
      valid_attrs = %{date: ~U[2024-01-04 03:56:00Z], title: "some title", total_value: "120.5", installments: 42}

      assert {:ok, %Purchase{} = purchase} = Dashboard.create_purchase(valid_attrs)
      assert purchase.date == ~U[2024-01-04 03:56:00Z]
      assert purchase.title == "some title"
      assert purchase.total_value == Decimal.new("120.5")
      assert purchase.installments == 42
    end

    test "create_purchase/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dashboard.create_purchase(@invalid_attrs)
    end

    test "update_purchase/2 with valid data updates the purchase" do
      purchase = purchase_fixture()
      update_attrs = %{date: ~U[2024-01-05 03:56:00Z], title: "some updated title", total_value: "456.7", installments: 43}

      assert {:ok, %Purchase{} = purchase} = Dashboard.update_purchase(purchase, update_attrs)
      assert purchase.date == ~U[2024-01-05 03:56:00Z]
      assert purchase.title == "some updated title"
      assert purchase.total_value == Decimal.new("456.7")
      assert purchase.installments == 43
    end

    test "update_purchase/2 with invalid data returns error changeset" do
      purchase = purchase_fixture()
      assert {:error, %Ecto.Changeset{}} = Dashboard.update_purchase(purchase, @invalid_attrs)
      assert purchase == Dashboard.get_purchase!(purchase.id)
    end

    test "delete_purchase/1 deletes the purchase" do
      purchase = purchase_fixture()
      assert {:ok, %Purchase{}} = Dashboard.delete_purchase(purchase)
      assert_raise Ecto.NoResultsError, fn -> Dashboard.get_purchase!(purchase.id) end
    end

    test "change_purchase/1 returns a purchase changeset" do
      purchase = purchase_fixture()
      assert %Ecto.Changeset{} = Dashboard.change_purchase(purchase)
    end
  end

  describe "installments" do
    alias FinanceiroApp.Dashboard.Installment

    import FinanceiroApp.DashboardFixtures

    @invalid_attrs %{value: nil, date: nil}

    test "list_installments/0 returns all installments" do
      installment = installment_fixture()
      assert Dashboard.list_installments() == [installment]
    end

    test "get_installment!/1 returns the installment with given id" do
      installment = installment_fixture()
      assert Dashboard.get_installment!(installment.id) == installment
    end

    test "create_installment/1 with valid data creates a installment" do
      valid_attrs = %{value: "120.5", date: ~U[2024-01-04 04:01:00Z]}

      assert {:ok, %Installment{} = installment} = Dashboard.create_installment(valid_attrs)
      assert installment.value == Decimal.new("120.5")
      assert installment.date == ~U[2024-01-04 04:01:00Z]
    end

    test "create_installment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dashboard.create_installment(@invalid_attrs)
    end

    test "update_installment/2 with valid data updates the installment" do
      installment = installment_fixture()
      update_attrs = %{value: "456.7", date: ~U[2024-01-05 04:01:00Z]}

      assert {:ok, %Installment{} = installment} = Dashboard.update_installment(installment, update_attrs)
      assert installment.value == Decimal.new("456.7")
      assert installment.date == ~U[2024-01-05 04:01:00Z]
    end

    test "update_installment/2 with invalid data returns error changeset" do
      installment = installment_fixture()
      assert {:error, %Ecto.Changeset{}} = Dashboard.update_installment(installment, @invalid_attrs)
      assert installment == Dashboard.get_installment!(installment.id)
    end

    test "delete_installment/1 deletes the installment" do
      installment = installment_fixture()
      assert {:ok, %Installment{}} = Dashboard.delete_installment(installment)
      assert_raise Ecto.NoResultsError, fn -> Dashboard.get_installment!(installment.id) end
    end

    test "change_installment/1 returns a installment changeset" do
      installment = installment_fixture()
      assert %Ecto.Changeset{} = Dashboard.change_installment(installment)
    end
  end
end
