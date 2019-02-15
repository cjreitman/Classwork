
class NullPiece < Piece
  include Singleton
  attr_reader :color, :symbol
  
  def initialize
    @color = "Cyan"
    @symbol = "N"
  end
  
  def to_s
    "N"
  end

end