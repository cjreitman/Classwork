require_relative "card.rb"

class Deck

  def self.create_deck
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards.shuffle #set this to shuffle otherwise everyone will be dealt a card in a row
  end

  def initialize(cards = Deck.create_deck)
    @cards = cards
  end

  def count 
    @cards.length
  end

  def take(n)
    taken = []
    if n <= @cards.count
      n.times do
        taken << @cards.shift
      end
    else
      raise "Not enough cards, booboo"
    end
    taken

    #instead of this do somethign like if count < n puts "no more cards", else card.shift(n)
  end

  def empty?
    count == 0
  end

  def return(cards)
    @cards += cards
  end
end