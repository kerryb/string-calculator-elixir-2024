defmodule StringCalculator.Calculator do
  def add(""), do: "0"

  def add(input) do
    input
    |> String.split(",")
    |> Enum.map(&to_float/1)
    |> Enum.sum()
    |> Float.round(8)
    |> to_string()
    |> String.replace_suffix(".0", "")
  end

  defp to_float(string) do
    {float, _} = Float.parse(string)
    float
  end
end
