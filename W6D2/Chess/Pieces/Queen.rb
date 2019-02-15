require_relative "../Modules"
require_relative "../Piece"

class Queen < Piece
  attr_reader :symbol, :color
  include Slidable 
  
  def initialize(name, start_pos, color, board)
    super(name, start_pos, color, board)
    @symbol = :Q
    @color = color
  end

  def move_dirs
    return [[-1,0], [0,1], [1,0], [0,-1], [1, 1], [-1, -1], [-1, 1], [1, -1]]
  end

  def to_s
    "Q"
  end
end

