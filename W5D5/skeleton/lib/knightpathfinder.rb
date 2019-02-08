require_relative "./00_tree_node.rb"

class KnightPathFinder
    
    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        @considered_position = [pos]
    end

    def self.valid_moves(pos)

        return true

    end

    def new_move_positions(pos)
        new_position = []
        if KnightPathFinder.valid_moves(pos) && !@considered_position.include?(pos)
            new_position << pos
            @considered_position << pos
        end
        new_position
    end


end