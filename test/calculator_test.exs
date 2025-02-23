defmodule StringCalculator.CalculatorTest do
  use ExUnit.Case, async: true
  alias StringCalculator.Calculator

  describe "StringCalculator.Calculator.add/1" do
    test "returns zero for an empty string" do
      assert Calculator.add("") == {:ok, "0"}
    end

    test "returns the number for a single number" do
      assert Calculator.add("42") == {:ok, "42"}
    end

    test "handles single numbers with a decimal point" do
      assert Calculator.add("4.2") == {:ok, "4.2"}
    end

    test "adds multiple numbers together" do
      assert Calculator.add("4.2,3,5,10.1") == {:ok, "22.3"}
    end

    test "formats the result as an integer if it has no decimal places" do
      assert Calculator.add("4.2,3,5,10.8") == {:ok, "23"}
    end

    test "allows newlines as separators" do
      assert Calculator.add("4.2,3,5\n10.8") == {:ok, "23"}
    end

    test "returns an error if the input ends in a separator" do
      assert Calculator.add("1,2,") == {:error, "Number expected but EOF found."}
    end
  end
end
