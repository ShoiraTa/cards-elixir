defmodule Cards do
@moduledoc """
  Provides methods fore creating and handling a deck of cards
"""

@doc """
Returns a list of stringsrepresenting a deck of playing cards
"""
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

  @doc """
    Divides a deck into 2 parts, hand and the reminder of the dec. the `hand_size` argument indicateshow many cardsshould be in hand
  ## Examples
      iex> deck =Cards.create_deck
      iex> {hand, deck } = Cards.deal(deck, 3)
      iex>  hand
      #> ["Spades of Ace", "Spades of Two", "Spades of Three"]

  """
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
