defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    #Generates a nested list ([[], []])
    # cards = for value <- values do
    #  for suit <- suits do
    #    "#{value} of #{suit}"
    #  end
    # end
    # List.flatten(cards)

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end


  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Five of Spades")
      true
  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  #returns a tuple
  @doc """
    Divides a deck into a hand and the remainder of the deck
    The `hand_size` argument represents how many cards should be
    in the hand

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  def load(file_name) do

    case File.read(file_name) do
      {:ok, binary} -> :erlang.binary_to_term binary
      #{:error, :enoent} -> "That file does not exist"
      {:error, _} -> "That file does not exist"
    end

  end

  def create_hand(hand_size) do
    #deck = Cards.create_deck
    #deck = Cards.shuffle deck
    #hand = Cards.deal(deck, hand_size)

    #The return of one function is passed as first parameter for the other
    Cards.create_deck |> Cards.shuffle |> Cards.deal(hand_size)

  end

end
