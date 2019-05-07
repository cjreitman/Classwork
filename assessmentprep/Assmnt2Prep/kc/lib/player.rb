require_relative "hand"
require_relative "board"
class Player

  attr_reader :hand, :name

  def initialize(name, deck, board)
    @name = name
    @hand = Hand.new(deck)
    @board = board
  end

  def play
  
    @board.piles.each do |pile|
      @card.each do |card|
        pile.valid_play?(card)
          pile.new_top(card)
          @hand.remove(card)
      end
    end
    
    @board.piles.each do |pile|
      



  end

  def play


  end

end