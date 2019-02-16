require "colorize"
require_relative "Modules"
require "singleton"

class Piece

  attr_reader :color, :board, :name
  attr_accessor :pos

  def initialize(name, start_pos, color, board)
    @name = name
    @pos = start_pos
    @color = color
    @board = board
  end

  def to_s
    "P"
  end
  
  def move

  end

end
