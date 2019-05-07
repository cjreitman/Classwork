require_relative './card'
require_relative './hand'

class Deck
  #What is this? What does it do?
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

  def deal_hand
    Hand.new(take(5))
  end

  def count
    @cards.count
  end

  def take(n)
    if n <= count
      @cards.shift(n)
    else
      raise "not enough cards"
    end
  end

  def return(cards)
    @cards += cards
  end

  def shuffle
   @cards = @cards.shuffle
  end
end
