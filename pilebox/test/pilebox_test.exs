defmodule PileboxTest do
  use ExUnit.Case
  doctest Pilebox

  test "height should be 4" do
    h = %Pilebox.Pile{}
    |> Pilebox.add_box(2, 2)
    |> Pilebox.add_box(1, 1)
    |> Pilebox.add_box(1, 2)
    |> Pilebox.add_box(2, 1)
    |> Pilebox.get_height
    assert h == 4
  end

  test "height should be 11" do
    h = %Pilebox.Pile{}
    |> Pilebox.add_box(5, 7)
    |> Pilebox.add_box(3, 4)
    |> Pilebox.add_box(1, 2)
    |> Pilebox.add_box(2, 3)
    |> Pilebox.add_box(4, 2)
    |> Pilebox.add_box(4, 4)
    |> Pilebox.get_height
    assert h == 11
  end

  test "height should be 14" do
    h = %Pilebox.Pile{}
    |> Pilebox.add_box(3, 1)
    |> Pilebox.add_box(2, 2)
    |> Pilebox.add_box(1, 3)
    |> Pilebox.add_box(6, 9)
    |> Pilebox.add_box(5, 8)
    |> Pilebox.add_box(3, 7)
    |> Pilebox.add_box(4, 2)
    |> Pilebox.add_box(3, 1)
    |> Pilebox.add_box(2, 2)
    |> Pilebox.add_box(1, 4)
    |> Pilebox.get_height
    assert h == 14
  end

end
