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

  # Takes `n` cards from the top of the deck.
  def take(n)

    if @cards.length >= n
      @cards.shift(n)
    else
      raise "not enough cards"
    end
    
    
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)

    @cards += cards

  end
end
