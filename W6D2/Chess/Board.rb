
require_relative "./Piece"

class Board

  attr_reader :board
  
  def initialize
    
    @board = Array.new(8) { Array.new(8)    }

  end

  def add_piece(piece, pos)
    if valid_pos?(pos)
      self[pos] = piece
    end
  end

  def valid_pos?(pos)
    y, x = pos
    return true if (x >= 0 && x < 8) && (y >= 0 && y < 8)
    false
  end

  def []=(pos, piece)
    y, x = pos
    @board[y][x] = piece
  end

  def [](pos)
    y, x = pos
    @board[y][x]
  end

  def move_piece(start_pos, end_pos)
    
    
    if self[start_pos].is_a?(Piece)
      piece = self[start_pos]
      self[end_pos] = piece
      self[start_pos] = nil
    else
      raise "Please select a position with a piece"
    end

  end

end


board = Board.new
piece = Piece.new("Knight")
board.add_piece(piece, [0, 0])
board.board
board.move_piece([0, 0], [1, 0])
board.board
p board[[5, 0]]
