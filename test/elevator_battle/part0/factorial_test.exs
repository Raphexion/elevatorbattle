defmodule ElevatorBattle.Part0.FactorialTest do
  use ExUnit.Case, async: true

  alias ElevatorBattle.Part0.Factorial.NonTailCall
  alias ElevatorBattle.Part0.Factorial.TailCall

  describe "implementation without tail-call" do
    test "minimal test" do
      assert NonTailCall.calc(0) == 1
      assert NonTailCall.calc(5) == 120
    end
  end

  describe "implementation with tail-call" do
    test "minimal test" do
      assert TailCall.calc(0) == 1
      assert TailCall.calc(5) == 120
    end
  end
end
