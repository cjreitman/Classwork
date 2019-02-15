require "byebug"
module Stepable

  def moves
    
    array = move_dirs
    refined_moves = refined_moveset(array)

  end

  def refined_moveset(array)

    
    possible_moves = []

    array.each do |move|
      cy, cx = @pos
      y, x = move
      cy += y
      cx += x
      possible_moves << [cy, cx] 
    end

    possible_moves.select do
      |move| @board.valid_pos?(move) } && !@board[move].is_a?(Piece)

  end

end

module Slidable

  def moves

    array = move_dirs
    move_array = []
    
    array.each do |dir|
      y, x = dir
      move_array += grow_unblocked_moves_in_dir(y, x)
    end

    move_array

  end
  
  def horizontal_dirs
  
    @up = [-1,0]
    @right = [0,1]
    @down = [1,0]
    @left = [0,-1]

  end

  def diagonal
    
    @down_and_right = [1, 1]
    @up_and_left = [-1, -1]
    @up_and_right = [-1, 1]
    @down_and_left = [1, -1]

  end

  private

  def grow_unblocked_moves_in_dir(dy, dx)

    moves = Array.new {Array.new}
    cy, cx = @pos

    new_pos = [cy + dy, cx + dx]
    
    until !@board.valid_pos?(new_pos) || @board[new_pos].is_a?(Piece)
      
      sub_array = new_pos.dup
      moves << sub_array
      new_pos[0] += dy
      new_pos[1] += dx

    end

    return moves

  end

end



