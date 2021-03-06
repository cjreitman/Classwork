# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
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

    if !@cards.empty?
      @cards.shift(n)
    end
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @cards += cards
  end

  protected
  attr_accessor :cards
end
