defmodule ClockRadius do
  def calculate(str) do
    split_string(str)
    |> calculate_radius
  end

  def split_string(str) do
    String.split(str, ":")
    |> Enum.map(fn(x) -> String.to_integer x end)
    |> List.to_tuple
  end

  def calculate_radius(time_parts) do
    hr = elem(time_parts, 0) * 30
    mr = elem(time_parts, 1) * 6
    abs(hr - mr)
  end

end
