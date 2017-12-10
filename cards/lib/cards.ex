defmodule Cards do

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

  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  #returns a tuple
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

end
