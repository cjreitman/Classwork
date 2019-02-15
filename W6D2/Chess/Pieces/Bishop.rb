require_relative "../Piece"
require_relative "../Modules"

class Bishop < Piece
attr_reader :symbol, :color
include Slidable
  def initialize(name, start_pos, color, board)
    super(name, start_pos, color, board)
    @symbol = :B
    @color = color
  end

  def move_dirs
    return [[1, 1], [-1, -1], [-1, 1], [1, -1]]
  end

  def to_s
    "B"
  end

end