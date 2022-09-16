defmodule Cards do
  def create_deck do
    cards = ["Ace", "Two", "Three"]
    suits = ["Spades", "Hearts", "Diamonds", "Clubs"]
    for suit <- suits, card <- cards do
        "#{suit} of #{card}"
    end
  end

  def shuffle_deck(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size )
  end

  def hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle_deck
    |> Cards.deal(hand_size)
  end

end

# {hand, the_rest} = Cards.hand(3)
