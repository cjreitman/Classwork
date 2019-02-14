
module Stepable

  def moves
    
  end

end

module Slidable

  def moves

    array = move_dirs
    move_array = []
    
    array.each do |dir|
      y, x = dir
      move_array << grow_unblocked_moves_in_dir(y, x)
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

  def move_dirs 

  end

  def grow_unblocked_moves_in_dir(dy, dx)

    moves = []
    cy, cx = @pos

    new_pos = [cy + dy, cx + dx]

    until @board[new_pos].is_a(Piece) || !@board.valid_pos?(new_pos)

      moves << new_pos
      new_pos[0] + dy
      new_pos[1] + dx

    end

    return moves

  end

end



