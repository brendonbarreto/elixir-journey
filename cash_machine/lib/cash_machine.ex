defmodule CashMachine do
  def withdraw(value) do
    bills = cond do
      rem(value, 3) == 0 || rem(value, 5) != 0 ->
        %CashMachine.BillValues{two: get_two_bills_needed(value)}
      true ->
        %CashMachine.BillValues{}
    end

    bills = %CashMachine.BillValues{bills | hundred: get_current_value(value, bills) |> get_bills_needed(100)}
    bills = %CashMachine.BillValues{bills | fifty: get_current_value(value, bills) |> get_bills_needed(50)}
    bills = %CashMachine.BillValues{bills | twelve: get_current_value(value, bills) |> get_bills_needed(20)}
    bills = %CashMachine.BillValues{bills | ten: get_current_value(value, bills) |> get_bills_needed(10)}
    bills = %CashMachine.BillValues{bills | five: get_current_value(value, bills) |> get_bills_needed(5)}
    bills = %CashMachine.BillValues{bills | two: bills.two + (get_current_value(value, bills) |> get_bills_needed(2))}
  end

  def get_current_value(value, bills) do
    value - ((bills.two * 2) + (bills.five * 5) + (bills.ten * 10) + (bills.twelve * 20) + (bills.fifty * 50) + (bills.hundred * 100))
  end

  def get_bills_needed(value, bill_value, count \\ 0) do
    case value >= bill_value do
      true  -> get_bills_needed(value - bill_value, bill_value, count + 1)
      false -> count
    end

  end

  def get_two_bills_needed(value, count \\ 0) do
    add_more = Enum.all?([5, 10, 20, 50], fn(bill_value) ->
      rem(value, bill_value) != 0
    end)

    case add_more do
      true  -> get_two_bills_needed(value - 2, count + 1)
      false -> count
    end
  end
end
