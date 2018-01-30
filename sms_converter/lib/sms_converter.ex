defmodule SmsConverter do
  def generate(letter) do
    char_numbers = [
      %{number: "0", chars: [" "]},
      %{number: "2", chars: ["a", "b", "c"]},
      %{number: "3", chars: ["d", "e", "f"]},
      %{number: "4", chars: ["g", "h", "i"]},
      %{number: "5", chars: ["j", "k", "l"]},
      %{number: "6", chars: ["m", "n", "o"]},
      %{number: "7", chars: ["p", "q", "r", "s"]},
      %{number: "8", chars: ["t", "u", "v"]},
      %{number: "9", chars: ["w", "x", "y", "z"]}
    ]

    get_char_sequence(char_numbers, letter)
    |> Enum.with_index
    |> fill_underscores
    |> List.to_string
  end

  def get_char_sequence(char_numbers, letter) do
    Enum.map(String.split(letter, "", trim: true), fn(input_char) ->
      find_number(char_numbers, input_char)
    end)
  end

  def fill_underscores(list) do
    Enum.map(list, fn(indexed_char) ->
      { char, index } = indexed_char

      cond do
        index == 0 ->
          char
        String.last(char) == String.last(elem(Enum.at(list, index - 1), 0)) ->
          "_" <> char
        true ->
          char
      end
    end)
  end

  def find_number(char_numbers, char) do
    cn = Enum.find(char_numbers, fn(m) -> Enum.member?(m.chars, char) end)
    char_index = Enum.find_index(cn.chars, fn(m) -> char == m end)
    String.duplicate(cn.number, char_index + 1)
  end
end
