require "colorize"
require_relative "Modules"
require "singleton"
require_relative "./Board.rb"

class Piece

  attr_reader :color, :board, :pos

  def initialize(name, start_pos, color, board)
    @name = name
    @pos = start_pos
    @color = color
    @board = board
  end

  def to_s
    "P"
  end

  def moves 

  end

end

class Rook < Piece

  include Slidable 

  def initialize(name, start_pos, color, board)
    super
  end

  def move_dirs
    return [[-1,0], [0,1], [1,0], [0,-1]]
  end

end

class Queen < Piece

include Slidable 

  def initialize(name, start_pos, color, board)
    super
  end

  def move_dirs
    return [[-1,0], [0,1], [1,0], [0,-1], [1, 1], [-1, -1], [-1, 1], [1, -1]]
  end


end

class Bishop < Piece

  def initialize(name, start_pos, color, board)
    super
  end

  def move_dirs
    return [[1, 1], [-1, -1], [-1, 1], [1, -1]]
  end

end


class Pawn


end

class Knight

end


class NullPiece < Piece
  include Singleton

  def initialize
    @color = "black"
  end
  
  def to_s
    "N"
  end

end


board = Board.new
null_piece = NullPiece.instance
p queen = Queen.new("Queen", [0, 0], "Red", board)
