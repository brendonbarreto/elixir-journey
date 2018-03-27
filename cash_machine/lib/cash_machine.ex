defmodule CashMachine do
  import Integer
  @bills [5, 100, 50, 20, 10, 2]

  def withdraw(total_value) do
    cond do
      total_value <= 3 -> []
      true ->
        get_bills(total_value)
        |> arrange
    end
  end

  def arrange(bills) do
    Enum.filter(bills, fn(bill) -> !is_nil(bill) end)
    |> List.keysort(0)
  end

  def get_bills(total_value) do
    Enum.map(@bills, fn(bill) ->
      bill_sum = get_bill_sum bill, total_value
      cond do
        bill_sum > 0 -> {bill, div(bill_sum, bill)}
        true -> nil
      end
    end)
  end

  def get_bill_sum(5, total_value) do
    if Integer.is_odd(total_value), do: 5, else: 0
  end

  def get_bill_sum(bill_value, total_value) do
    map = Enum.map(get_previous_bills(bill_value), fn(previous_bill) ->
      get_bill_sum(previous_bill, total_value)
    end)

    old_sum = Enum.reduce(map, 0, fn(x, acc) -> x + acc end)
    remain = total_value - old_sum
    sum_bill bill_value, remain
  end

  def sum_bill(bill_value, remain, acc \\ 0) do
    cond do
       remain >= bill_value ->
         new_acc = acc + bill_value
         sum_bill(bill_value, remain - bill_value, new_acc)
       true -> acc
    end
  end

  def get_previous_bills(bill_value) do
    index = Enum.find_index(@bills, fn(bill) -> bill == bill_value end)
    Enum.slice(@bills, 0, index)
  end
end
