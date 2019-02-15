require_relative "../Modules"
require_relative "../Piece"

class Knight < Piece
  attr_reader :symbol, :color
  include Stepable 
  
  def initialize(name, start_pos, color, board)
    super(name, start_pos, color, board)
    @symbol = :K
    @color = color

  end

  def move_dirs
    return [
    [-1, -2],
    [-2, -1],
    [1, 2],
    [1, -2],
    [2, 1],
    [2, -1],
    [-1, 2],
    [-2, 1]
    ]
  end

  def to_s
    "K"
  end

end