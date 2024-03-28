defmodule FinanceiroApp.Importer do
  alias FinanceiroApp.Dashboard.EnumConversion
  alias FinanceiroApp.Dashboard.Subscription
  alias FinanceiroApp.Dashboard.Purchase

  def import_data(path, current_user) do
    file =
      path
      |> Enum.at(0)
      |> then(&Path.join(Application.app_dir(:financeiro_app, "priv/static/"), &1))

    subscriptions =
      file
      |> Xlsxir.stream_list(0)
      |> run(:subscriptions, current_user)

    bills =
      file
      |> Xlsxir.stream_list(1)
      |> run(:bills, current_user)

    {subscriptions, bills}
  end

  defp run(rows, :subscriptions, current_user) do
    rows
    |> separate_headers()
    |> rows_to_map()
    |> get_subscriptions(current_user)
  end

  defp run(rows, :bills, current_user) do
    rows
    |> separate_headers()
    |> rows_to_map()
    |> get_bills(current_user)
  end

  defp separate_headers(rows) do
    headers = Stream.take(rows, 1)
    rows = Stream.drop(rows, 1)
    {headers, rows}
  end

  defp rows_to_map({_headers, rows}) do
    Enum.to_list(rows)
  end

  defp get_bills(rows, current_user) do
    rows
    |> Enum.map(fn element ->
      if(Enum.at(element, 0) != nil) do
        Purchase.changeset(%Purchase{}, %{
          date:
            {Enum.at(element, 0), {0, 0, 0}}
            |> NaiveDateTime.from_erl!()
            |> DateTime.from_naive!("Etc/UTC"),
          title: Enum.at(element, 1),
          total_value: Enum.at(element, 2),
          total_installments: Enum.at(element, 3),
          user_id: current_user.id
        })
      end
    end)
    |> Enum.filter(fn element -> element != nil  end)
  end

  defp get_subscriptions(rows, current_user) do
    rows
    |> Enum.map(fn element ->
      if(Enum.at(element, 2) != nil) do
        Subscription.changeset(%Subscription{}, %{
          title: Enum.at(element, 0),
          value: Enum.at(element, 1),
          type: element |> Enum.at(2) |> EnumConversion.convert_to_type(),
          user_id: current_user.id
        })
      end
    end)
  |> Enum.filter(fn element -> element != nil  end)
  end
end
