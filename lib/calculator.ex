defmodule StringCalculator.Calculator do
  @separator_pattern "[,\n]"

  def add(input) do
    cond do
      input == "" -> {:ok, "0"}
      input =~ ~r/#{@separator_pattern}$/ -> {:error, "Number expected but EOF found."}
      true -> {:ok, calculate(input)}
    end
  end

  defp calculate(input) do
    input
    |> String.split(~r/#{@separator_pattern}/)
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
