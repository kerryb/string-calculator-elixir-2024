defmodule StringCalculator.CalculatorTest do
  use ExUnit.Case, async: true
  alias StringCalculator.Calculator

  describe "StringCalculator.Calculator.add/1" do
    test "returns zero for an empty string" do
      assert Calculator.add("") == "0"
    end

    test "returns the number for a single number" do
      assert Calculator.add("42") == "42"
    end
  end
end
