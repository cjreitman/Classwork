require "colorize"

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

  def move_dirs



  end


end








class NullPiece < Piece

  def to_s
    "N"
  end


end
