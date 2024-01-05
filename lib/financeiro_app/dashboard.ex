defmodule FinanceiroApp.Dashboard do
  @moduledoc """
  The Dashboard context.
  """

  import Ecto.Query, warn: false
  alias FinanceiroApp.Repo

  alias FinanceiroApp.Dashboard.Subscription

  @doc """
  Returns the list of subscriptions.

  ## Examples

      iex> list_subscriptions()
      [%Subscription{}, ...]

  """
  def list_subscriptions do
    Repo.all(Subscription)
  end

  @doc """
  Gets a single subscription.

  Raises `Ecto.NoResultsError` if the Subscription does not exist.

  ## Examples

      iex> get_subscription!(123)
      %Subscription{}

      iex> get_subscription!(456)
      ** (Ecto.NoResultsError)

  """
  def get_subscription!(id), do: Repo.get!(Subscription, id)

  @doc """
  Creates a subscription.

  ## Examples

      iex> create_subscription(%{field: value})
      {:ok, %Subscription{}}

      iex> create_subscription(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_subscription(attrs \\ %{}) do
    %Subscription{}
    |> Subscription.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a subscription.

  ## Examples

      iex> update_subscription(subscription, %{field: new_value})
      {:ok, %Subscription{}}

      iex> update_subscription(subscription, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_subscription(%Subscription{} = subscription, attrs) do
    subscription
    |> Subscription.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a subscription.

  ## Examples

      iex> delete_subscription(subscription)
      {:ok, %Subscription{}}

      iex> delete_subscription(subscription)
      {:error, %Ecto.Changeset{}}

  """
  def delete_subscription(%Subscription{} = subscription) do
    Repo.delete(subscription)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking subscription changes.

  ## Examples

      iex> change_subscription(subscription)
      %Ecto.Changeset{data: %Subscription{}}

  """
  def change_subscription(%Subscription{} = subscription, attrs \\ %{}) do
    Subscription.changeset(subscription, attrs)
  end

  alias FinanceiroApp.Dashboard.Purchase

  @doc """
  Returns the list of purchases.

  ## Examples

      iex> list_purchases()
      [%Purchase{}, ...]

  """
  def list_purchases do
    Repo.all(Purchase)
  end

  @doc """
  Gets a single purchase.

  Raises `Ecto.NoResultsError` if the Purchase does not exist.

  ## Examples

      iex> get_purchase!(123)
      %Purchase{}

      iex> get_purchase!(456)
      ** (Ecto.NoResultsError)

  """
  def get_purchase!(id), do: Repo.get!(Purchase, id)

  @doc """
  Creates a purchase.

  ## Examples

      iex> create_purchase(%{field: value})
      {:ok, %Purchase{}}

      iex> create_purchase(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_purchase(attrs \\ %{}) do
    %Purchase{}
    |> Purchase.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a purchase.

  ## Examples

      iex> update_purchase(purchase, %{field: new_value})
      {:ok, %Purchase{}}

      iex> update_purchase(purchase, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_purchase(%Purchase{} = purchase, attrs) do
    purchase
    |> Purchase.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a purchase.

  ## Examples

      iex> delete_purchase(purchase)
      {:ok, %Purchase{}}

      iex> delete_purchase(purchase)
      {:error, %Ecto.Changeset{}}

  """
  def delete_purchase(%Purchase{} = purchase) do
    Repo.delete(purchase)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking purchase changes.

  ## Examples

      iex> change_purchase(purchase)
      %Ecto.Changeset{data: %Purchase{}}

  """
  def change_purchase(%Purchase{} = purchase, attrs \\ %{}) do
    Purchase.changeset(purchase, attrs)
  end

  alias FinanceiroApp.Dashboard.Installment

  @doc """
  Returns the list of installments.

  ## Examples

      iex> list_installments()
      [%Installment{}, ...]

  """
  def list_installments do
    Repo.all(Installment)
  end

  @doc """
  Gets a single installment.

  Raises `Ecto.NoResultsError` if the Installment does not exist.

  ## Examples

      iex> get_installment!(123)
      %Installment{}

      iex> get_installment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_installment!(id), do: Repo.get!(Installment, id)

  @doc """
  Creates a installment.

  ## Examples

      iex> create_installment(%{field: value})
      {:ok, %Installment{}}

      iex> create_installment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_installment(attrs \\ %{}) do
    %Installment{}
    |> Installment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a installment.

  ## Examples

      iex> update_installment(installment, %{field: new_value})
      {:ok, %Installment{}}

      iex> update_installment(installment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_installment(%Installment{} = installment, attrs) do
    installment
    |> Installment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a installment.

  ## Examples

      iex> delete_installment(installment)
      {:ok, %Installment{}}

      iex> delete_installment(installment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_installment(%Installment{} = installment) do
    Repo.delete(installment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking installment changes.

  ## Examples

      iex> change_installment(installment)
      %Ecto.Changeset{data: %Installment{}}

  """
  def change_installment(%Installment{} = installment, attrs \\ %{}) do
    Installment.changeset(installment, attrs)
  end
end
