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

    test "handles single numbers with a decimal point" do
      assert Calculator.add("4.2") == "4.2"
    end

    test "adds two numbers together" do
      assert Calculator.add("4.2,3") == "7.2"
    end
  end
end
