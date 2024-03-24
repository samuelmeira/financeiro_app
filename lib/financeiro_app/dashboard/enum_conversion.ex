defmodule FinanceiroApp.Dashboard.EnumConversion do
  @enum_types %{
    "Casa" => :home,
    "Educação" => :education,
    "Eletrônicos" => :electronics,
    "Lazer" => :leisure,
    "Restaurante" => :restaurant,
    "Saúde" => :health,
    "Serviços" => :services,
    "Supermercado" => :grocery,
    "Transporte" => :transportation,
    "Vestuário" => :clothing,
    "Viagem" => :travel,
    "Outros" => :other
  }


  def convert_to_type(type) do
    Map.get(@enum_types, type, :unknown)
  end
end
