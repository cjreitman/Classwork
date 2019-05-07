require_relative "deck"

class Hand

  attr_reader :cards

  def initialize(deck)
    @cards = deck.take(7)
    @deck = deck
  end

  def empty?
    @cards.is_empty?
  end

  def take_one
   @cards += @deck.take(1)
  end

end

