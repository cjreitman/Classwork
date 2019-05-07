require_relative 'card'
require "byebug"

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    cards = []
    suits = Card.suits
    values = Card.values
    suits.each do |suit|
      values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.length
  end

  def empty?
    if self.count > 0
      return false
    elsif self.count == 0
      return true
    end
  end

  # Takes `n` cards from the top of the deck (front of the cards array).
  def take(n)
    taken = []
    if n <= @cards.count
      n.times do 
        taken << @cards.shift
      end
    else
      raise "not enough cards"
    end

    taken
  end

  # Returns an array of cards to the bottom of the deck (back of the cards array).
  def return(new_cards)
    @cards += new_cards
  end
end
