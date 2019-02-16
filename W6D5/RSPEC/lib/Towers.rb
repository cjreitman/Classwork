class Tower
  attr_accessor :stacks

  def initialize
    @stacks = [ [3,2,1], [], [] ]
  end

  def moving_piece(stack)
    unless  stack < 0 || stack > 2 || @stacks[stack].empty?
      @stacks[stack].pop
    else
      raise "Must select a valid, non-empty stack"
    end
	end
	
  def move(o_stack, to_stack)
		piece = moving_piece(o_stack)
    @stacks[to_stack].push(piece)
    @stacks
	end


  # puts "Please select a stack to move from: "
  #   input = gets.chomp.to_i
    
  #   puts "Please select a stack to move to: "
	# 	input = gets.chomp.to_i
end