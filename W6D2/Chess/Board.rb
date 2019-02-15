
require_relative "Display.rb"
require_relative "Require.rb"


class Board

  attr_reader :board
  
  def initialize
    @board = Array.new(8) { Array.new(8) }
    self.populate
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
      moves = (self[start_pos]).moves     
      # print moves 
      if moves.include?(end_pos)
        self[start_pos].pos = end_pos
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
      else
        puts "you can't move there" # Come back to this and add a retry to prompt the user for input again
      end
      
    else
      raise "Please select a position with a piece"
    end

  end

  def find_king(color)
    self.board.each_with_index do |row, idx1|
      row.each_with_index do |cell, idx2|
        return [idx1, idx2] if cell.is_a?(King) && cell.color == color
      end
    end
  end

  def populate

    (0...8).each do |i|
      @board[1][i] = Pawn.new("Pawn#{i}", [1, i], "Black", self)
    end

    (0...8).each do |i|
      @board[6][i] = Pawn.new("Pawn#{i}", [6, i], "White", self)
    end

    @board[0][0] = Rook.new("Rook1", [0, 0], "Black", self)
    @board[0][7] = Rook.new("Rook2", [0, 7], "Black", self) 
    @board[0][1] = Knight.new("Knight1", [0, 1], "Black", self)
    @board[0][6] = Knight.new("Knight2", [0, 6], "Black", self)
    @board[0][2] = Bishop.new("Bishop1", [0, 2], "Black", self)
    @board[0][5] = Bishop.new("Bishop2", [0, 5], "Black", self)
    @board[0][3] = Queen.new("Queen", [0, 3], "Black", self)
    @board[0][4] = King.new("King", [0, 4], "Black", self)


    @board[7][0] = Rook.new("Rook3", [7, 0], "White", self)
    @board[7][7] = Rook.new("Rook4", [7, 7], "White", self)    
    @board[7][1] = Knight.new("Knight3", [7, 1], "White", self)
    @board[7][6] = Knight.new("Knight4", [7, 6], "White", self)    
    @board[7][2] = Bishop.new("Bishop3", [7, 2], "White", self)
    @board[7][5] = Bishop.new("Bishop4", [7, 5], "White", self)    
    @board[7][3] = Queen.new("Queen2", [7, 3], "White", self)
    @board[7][4] = King.new("King2", [7, 4], "White", self)

  end


  def in_check?(color)

    y, x = find_king(color)
    
    board.each.with_index do |row, i|
      row.each_with_index do |cell, i2|
        if cell.is_a?(Piece) && cell.color != color
          attacks = cell.moves
         
          if attacks.include?([y, x])
            
            p "check!"
            return true
          end
        end
      end
    end
    false
  end

end


board = Board.new
# board.move_piece()
# print board.board
display = Display.new(board)
board.move_piece([0, 6], [2, 5])
board.move_piece([2, 5], [4, 4])
board.move_piece([4, 4], [3, 2])
board.move_piece([3, 2], [5, 3])
p board.in_check?("White")

# p board.board
#board.move_piece([5, 4], [])


