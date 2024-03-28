defmodule FinanceiroAppWeb.DashboardLive do
  alias FinanceiroApp.Repo
  alias FinanceiroApp.Dashboard.Subscription
  use FinanceiroAppWeb, :live_view

  alias FinanceiroApp.Importer
  alias FinanceiroApp.Accounts


  @impl Phoenix.LiveView
  def mount(_params, %{"user_token" => user_token} = _session, socket) do

    socket =
      assign_new(socket, :current_user, fn ->
        Accounts.get_user_by_session_token(user_token)
      end)

    {:ok,
     socket
     |> assign(:uploaded_files, [])
     |> assign(:subscriptions, [])
     |> assign(:bills, [])
     |> allow_upload(:sheet, accept: ~w(.xlsx), max_entries: 1)}
  end

  @impl Phoenix.LiveView
  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  @impl Phoenix.LiveView
  def handle_event("save", _params, socket) do
    uploaded_files =
      consume_uploaded_entries(socket, :sheet, fn %{path: path}, _entry ->
        dest =
          Path.join(
            Application.app_dir(:financeiro_app, "priv/static/uploads"),
            Path.basename(path)
          ) <> ".xlsx"

        # You will need to create `priv/static/uploads` for `File.cp!/2` to work.
        File.cp!(path, dest)
        {:ok, ~p"/uploads/#{Path.basename(dest)}"}
      end)

    {subscriptions, bills} =
      uploaded_files
      |> Importer.import_data(socket.assigns.current_user)


    IO.inspect(subscriptions, label: "subscriptions")
    IO.inspect(bills, label: "bills")

    # socket =
    #   socket
    #   |> update(:uploaded_files, &(&1 ++ uploaded_files))
    #   |> update(:subscriptions, &(&1 ++ subscriptions))
    #   |> update(:bills, &(&1 ++ bills))

    {:noreply, update(socket, :uploaded_files, &(&1 ++ uploaded_files))}
  end

  @impl Phoenix.LiveView
  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :sheet, ref)}
  end

  # defdelegate get_value(value), to: Dashboard, as: :get_value

  def get_value(value) when is_float(value) do
    value
    |> Decimal.from_float()
    |> Decimal.round(2)
  end

  def get_value(value) when is_integer(value) do
    value
    |> Integer.to_string()
    |> Decimal.new()
    |> Decimal.round(2)
  end

  def get_value(value) when is_nil(value), do: "-"

  def get_remaining(bills) when is_binary(bills) do
    with [current, total] <- String.split(bills, " de ") do
      String.to_integer(total) - String.to_integer(current)
    end
  end

  def get_remaining(_bills), do: 0

  def calculate_bills_value(bills) do
    total =
      bills
      |> Enum.map(fn bill ->
        remaining =
          bill
          |> Enum.at(6)
          |> get_remaining()

        range = 0..remaining

        Enum.map(range, fn _value -> bill |> Enum.at(5) |> get_value() end)
      end)

    total
    |> Enum.reduce([], fn list, acc ->
      list
      |> IO.inspect()

      Enum.zip(acc, list)
      |> Enum.map(&Decimal.add(elem(&1, 0), elem(&1, 1)))
    end)
  end

  def error_to_string(:too_large), do: "Too large"
  def error_to_string(:not_accepted), do: "You have selected an unacceptable file type"
  def error_to_string(:too_many_files), do: "You have selected too many files"
end
