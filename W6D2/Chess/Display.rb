require "colorize"
require_relative "./cursor.rb"
require_relative "Piece.rb"
require "byebug"

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render

    @board.board.each_with_index do |row, idx1|
      # p idx1
      row.each_with_index do |cell, idx2|
         
        to_print = ""
        if cell.is_a?(Piece)
          to_print << cell.to_s + " "
        else
          to_print << "x" + " "
        end

        if [idx1, idx2] == @cursor.cursor_pos
          print to_print.colorize(background: :blue)
        elsif to_print == "x" + " "
          print to_print
        else 
          print to_print.colorize(:red)
        end
      end
      puts
    end
      
  end

  def get_input

    loop do #we'll have to come back to this later to replace the loop do with a check to see if the game is still playing
      system "clear"
      self.render
      @cursor.get_input
    end

  end

  
end
