require_relative "./00_tree_node.rb"

class KnightPathFinder

    attr_reader :pos
    
    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        @considered_position = [pos]
    end

    def self.valid_moves(arr_pos)
        arr = []
        arr_pos.each do |pos|
            if (pos[0]<8 && pos[1]<8) && (pos[0]>=0 && pos[1]>=0)
                arr << pos
            end
        end
    arr
    end

    def new_move_positions(pos)
        new_position = []
        unchecked_positions = []
        x,y = pos
        pos1 = [x-2, y+1]
        pos2 = [x-1, y+2]
        pos3 = [x+1, y+2]
        pos4 = [x+2, y+1]
        pos5 = [x+2, y-1]
        pos6 = [x+1, y-2]
        pos7 = [x-1, y-2]
        pos8 = [x-2, y-1]
        unchecked_positions <<pos1<<pos2<<pos3<<pos4<<pos5<<pos6<<pos7<<pos8

        valid_positions = KnightPathFinder.valid_moves(unchecked_positions)
        valid_positions.each do |pos| 
            if !@considered_position.include?(pos)
                new_position << pos
                @considered_position << pos
            end
        end
        
        new_position
    end

    def build_move_tree

        queue = [@root_node]

        while !queue.empty?
            current_node = queue.shift
            current_pos = current_node.value
            new_nodes = new_move_positions(current_pos)
            new_nodes.map! do |pos| 
                next_node = PolyTreeNode.new(pos)
                current_node.add_child(next_node)
                queue.push(next_node)
            end
        end
        nil
    end

    def find_path(end_pos)
        build_move_tree
        end_node = @root_node.dfs(end_pos)
        trace_path_back(end_node)
        
    end

    def trace_path_back(end_node)
        
        path_array = [end_node.value]
        arr_node = []

        until end_node.parent.nil?
            arr_node << end_node.parent
            end_node = arr_node.last
        end
        
        arr_node.each do |e|
            path_array << e.value
        end
        return path_array.reverse
    end

end

# kps = KnightPathFinder.new([0, 0])
# kpf.build_move_tree
# a = kps.find_path([7, 7])
# p kps.trace_path_back(a)

kpf = KnightPathFinder.new([0, 0])

p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
