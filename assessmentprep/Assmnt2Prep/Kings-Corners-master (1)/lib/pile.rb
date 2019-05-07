require "byebug"

# Represents the Foundation and kings Corner "pile" of cards on which to play Kings Corners.
class Pile
  attr_accessor :seq

  def initialize(top_card = nil)
    
    @seq = []
    if top_card.nil?
      @type = "corner"
    else
      @type = "foundation"
      @seq += top_card
    end
  end

  # Returns the color of the top card.
  def top_color
    @seq.first.color
  end

  # Returns the rank of the top card.
  def top_rank
    @seq.first.rank
  end

  # Returns the color of the bottom card.
  def bottom_color
   @seq.last.color
  end

  # Returns the rank of the bottom card.
  def bottom_rank
    @seq.last.rank
  end

  def foundation?
    @type == "foundation"
  end

  def corner?
    @type == "corner"
  end

  def empty?
   @seq.empty?
  end

  # Returns true if a card is valid to play in this circumstance. Card
  # should either:
  #   (1) On a non-empty pile (Foundation or Corner), be one rank lower and alternating color
  #   (2) On an empty Foundation pile, any card
  #   (3) On an empty Corner pile, a KING
  
  def valid_card_play?(card)
    case 
    when !self.empty?
        return (card.rank == top_rank-1) && (card.color != top_color)
    when self.empty? && foundation?
        return true
    when self.empty? && corner?  
        return (card.rank == 13) #king
    end
    false
  
  end

  # Returns true if pile can move onto another pile. Solitaire pattern must be maintained.
  def valid_move_onto?(pile)

    
  end

  # Plays a card on the top of the pile, objecting if it is
  # not valid.
  def play(card)
    if !valid_card_play?(card)
      raise 'invalid card play'
    else
      seq.unshift(card)
    end
  end

  # Pile has been removed 
  def remove
    @seq = []
  end

  # Pile is receiving another pile on top of it
  def receive(incoming_cards)
    @seq += incoming_cards
  end

  def show
    @sec.each do |card|
      puts card
    end
  end

  private
  attr_reader :type

end
