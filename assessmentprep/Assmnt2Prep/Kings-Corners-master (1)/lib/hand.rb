require "byebug"

class Hand
  attr_accessor :cards

  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    Hand.new(deck.take(7))
   
  end

  def initialize(cards)
    @cards = cards
 
  end

  def play(board)
    # check for possible pile move
    

    # check for possible card move
 
    
  end

  def next_move?(board)
    # check for possible pile move
  
    

    # check for possible card move
    

    
  end

  def hit(deck)
    
  end

  def return_cards(deck)
    
  end

end
