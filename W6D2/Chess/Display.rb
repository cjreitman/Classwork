require "colorize"
require_relative "./Board.rb"
require_relative "./cursor.rb"
require_relative "Piece.rb"
require "byebug"

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([7,7], board)
  end

  def render

    @board.board.each_with_index do |row, idx1|
      row.each_with_index do |cell, idx2|
        if [idx1, idx2] == @cursor.cursor_pos
          print "X"
        elsif cell.is_a?(Piece)
          print cell.to_s.colorize(:red)
        else
          print "x"
        end
          
      end
      puts
    end
      
  end

  def get_input

    loop do
      system "clear"
      self.render
      @cursor.get_input
    end

  end

   

end

board = Board.new
piece = Piece.new("Knight")
board.add_piece(piece, [1, 0])
board.add_piece(piece, [0, 0])
display = Display.new(board)
display.get_input

