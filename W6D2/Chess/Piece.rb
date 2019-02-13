require "colorize"

class Piece

  attr_reader :color, :board, :pos

  def initialize(name)
    @name = name

  end

  def to_s
    "P"
  end

end

class NullPiece < Piece

  def to_s
    "N"
  end


end
