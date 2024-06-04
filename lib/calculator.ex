defmodule StringCalculator.Calculator do
  def add(input) do
    cond do
      input == "" ->
        {:ok, "0"}

      input =~ ~r/[,\n]$/ ->
        {:error, "Number expected but EOF found."}

      true ->
        {:ok,
         input
         |> String.split(~r/[,\n]/)
         |> Enum.map(&to_float/1)
         |> Enum.sum()
         |> Float.round(8)
         |> to_string()
         |> String.replace_suffix(".0", "")}
    end
  end

  defp to_float(string) do
    {float, _} = Float.parse(string)
    float
  end
end
