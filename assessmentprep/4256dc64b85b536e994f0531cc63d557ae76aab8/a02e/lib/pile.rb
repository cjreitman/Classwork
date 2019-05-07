class Pile
  attr_reader :corner
  attr_accessor :cards

  # Initializes as an empty regular pile by default
  def initialize(corner = false, cards = [])
    @corner = corner
    @cards = cards
  end

  def empty?
    @cards.empty?
  end

  def top_card
    @top_card = @cards.last
  end

  def bottom_card
    @bottom_card = @cards.first
  end
  
  def valid_move?(card)
    if !empty?
      if card.color != top_card.color && card.rank == top_card.rank - 1
        return true
      else
        return false
      end
    end
    
    if corner

      if empty? && card.value == :king
        return true
      else
        return false
      end
    else
      return true
    end

  end

  def move_all(to_pile)
    raise "Invalid pile move" if !to_pile.valid_move?(bottom_card)
    to_pile.cards += @cards
    @cards = []

  end

  def <<(card)
    cards << card
  end
end
