defmodule CashMachineTest do
  use ExUnit.Case
  doctest CashMachine

  test "withdraw 0 should return a empty list" do
    assert CashMachine.withdraw(0) == []
  end

  test "withdraw 1 should return a empty list" do
    assert CashMachine.withdraw(1) == []
  end

  test "withdraw 2 should return a empty list" do
    assert CashMachine.withdraw(2) == []
  end

  test "withdraw 3 should return a empty list" do
    assert CashMachine.withdraw(3) == []
  end

  test "withdraw 4" do
    assert CashMachine.withdraw(4) == [{2, 2}]
  end

  test "withdraw 9" do
    assert CashMachine.withdraw(9) == [{2, 2}, {5, 1}]
  end

  test "withdraw 10" do
    assert CashMachine.withdraw(10) == [{10, 1}]
  end

  test "withdraw 11" do
    assert CashMachine.withdraw(11) == [{2, 3}, {5, 1}]
  end

  test "withdraw 13" do
    assert CashMachine.withdraw(13) == [{2, 4}, {5, 1}]
  end

  test "withdraw 17" do
    assert CashMachine.withdraw(17) == [{2, 1}, {5, 1}, {10, 1}]
  end

  test "withdraw 40" do
    assert CashMachine.withdraw(40) == [{20, 2}]
  end

  test "withdraw 60" do
    assert CashMachine.withdraw(60) == [{10, 1}, {50, 1}]
  end

  test "withdraw 1438" do
    assert CashMachine.withdraw(1438) == [{2, 4}, {10, 1}, {20, 1}, {100, 14}]
  end
end
