require_relative "./00_tree_node.rb"

class KnightPathFinder
    
    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def self.valid_moves(pos)



    end


end