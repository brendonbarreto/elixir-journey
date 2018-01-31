defmodule Pilebox do
  def add_box(pile, width, height) do
    box = %Pilebox.Box{width: width, height: height}
    if length(pile.boxes) == 0 do
      %Pilebox.Pile{pile | boxes: pile.boxes ++ [box]}
    else
      last_box = List.last pile.boxes
      if(last_box.width > width) do
        new_box = %Pilebox.Box{last_box | pile: add_box(last_box.pile, width, height)}
        last_removed = List.delete(pile.boxes, last_box)
        %Pilebox.Pile{pile | boxes: last_removed ++ [new_box]}
      else
        %Pilebox.Pile{pile | boxes: pile.boxes ++ [box]}
      end
    end
  end

  def get_height(%Pilebox.Pile{boxes: boxes}) do
    map = Enum.map(boxes, fn(box) ->
      cond do
        Enum.count(box.pile.boxes) == 0 ->
          box.height
        true ->
          pile_height = get_height(box.pile)

          cond do
            pile_height > box.height ->
              pile_height
            true ->
              box.height
          end
      end
    end)

    Enum.reduce(map, fn(x, acc) -> x + acc end)
  end

end
