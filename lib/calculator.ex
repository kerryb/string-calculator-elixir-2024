defmodule StringCalculator.Calculator do
  def add(""), do: "0"

  def add(input) do
    input |> String.split(",") |> Enum.map(&to_float/1) |> Enum.sum() |> to_string()
  end

  defp to_float(string) do
    {float, _} = Float.parse(string)
    float
  end
end
