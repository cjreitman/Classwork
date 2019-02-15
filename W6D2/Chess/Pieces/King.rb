require_relative "../Modules"
require_relative "../Piece"

class King < Piece
  attr_reader :symbol, :color
  include Stepable 
  
  def initialize(name, start_pos, color, board)
    super(name, start_pos, color, board)
    @symbol = :Z
    @color = color

  end

  def move_dirs
    return [
    [1, 1],
    [-1, -1],
    [1, -1],
    [-1, 1],
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
    ]
  end

  def to_s
    "Z"
  end

end