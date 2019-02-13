require_relative 'tic_tac_toe_node'
require "byebug"
class SuperComputerPlayer < ComputerPlayer

  attr_reader :t_node

  def move(game, mark)
  
    @t_node = TicTacToeNode.new(game.board, mark)

    arr = @t_node.children

    arr.each do |child|
      return child.prev_move_pos if child.winning_node?(mark)
    end

    arr.each do |child|
      return child.prev_move_pos if !child.losing_node?(mark)
    end

    raise "Error!"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end


