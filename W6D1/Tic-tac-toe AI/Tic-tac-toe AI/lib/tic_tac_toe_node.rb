require_relative 'tic_tac_toe'
require "byebug"

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    
  end

  def losing_node?(evaluator)

    if board.over?
      return board.winner != evaluator && board.won?
    end

    arr = self.children
    
    if @next_mover_mark != evaluator
      arr.any? do |child|
        child.losing_node?(evaluator)
      end
    else
      arr.all? do |child|
        child.losing_node?(@next_mover_mark)
      end
    end

  end

  def winning_node?(evaluator)
  
    if board.over?
      return board.winner == evaluator && board.won?
    end

    arr = self.children
    
    if @next_mover_mark == evaluator
      arr.any? do |child|
        child.winning_node?(evaluator)
      end
    else
      arr.all? do |child|
        child.winning_node?(evaluator)
      end
    end


  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    ret_arr = []
    (0..2).each do |x|
      (0..2).each do |y|
        pos = [x, y]
        if board.empty?(pos)
          new_board = board.dup
          new_board[pos] = @next_mover_mark
          if @next_mover_mark == :x
            next_mark = :o
          else
            next_mark = :x
          end
          new_node = TicTacToeNode.new(new_board, next_mark, pos)
          ret_arr << new_node
        end
      end
    end
    
    ret_arr
  end       
end
