require_relative "../Modules"
require_relative "../Piece"

class Rook < Piece
  include Slidable
  attr_reader :symbol, :color
    def initialize(name, start_pos, color, board)
      super(name, start_pos, color, board)
      @symbol = :R
      @color = color
    end
  
    def move_dirs
      return [[0, 1], [0, -1], [-1, 0], [1, 0]]
  
    end

    def to_s
      "R"
    end

end
