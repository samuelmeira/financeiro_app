defmodule FinanceiroApp.Importer do

  def import_data(path) do

    path
    |> Enum.at(0)
    |> then(& Path.join(Application.app_dir(:financeiro_app, "priv/static/"), &1))
    |> Xlsxir.stream_list(1)
    |> run()
  end


  def run(rows) do
    rows
    |> separate_headers()
    |> rows_to_map()
    |> get_data()
  end

  def separate_headers(rows) do
    headers = Stream.take(rows, 1)
    rows = Stream.drop(rows, 1)
    {headers, rows}
  end

  def rows_to_map({_headers, rows}) do
    Enum.to_list(rows)
  end

  def get_data(rows) do
    index =
    rows
    |> Enum.find_index(fn element -> element |> Enum.at(0) === "Parcelas" end)

    subscriptions =
      rows
      |> Enum.take(index)

    bills =
      rows
      |> Enum.drop(index+1)

    {subscriptions, bills}

  end
end
