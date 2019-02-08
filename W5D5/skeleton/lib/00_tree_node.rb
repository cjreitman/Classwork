

class PolyTreeNode

    attr_reader :value, :parent, :children


   def initialize(value)
    
    @parent = nil
    @children = []
    @value = value
    
   end

    def parent=(node)

        if !@parent.nil? && @parent.children.include?(self)
            @parent.children.delete(self)
        end

        if !node.nil? && !node.children.include?(self) 
            node.children << self
        end

        @parent = node
    
    end


    def add_child(node)
        if !@children.include?(node)
            node.parent = self
            @children << node if !@children.include?(node)
        end
    end

    def remove_child(node)

        raise "The node is already parentless" if node.parent.nil?
        node.parent = nil
        @children.delete(node)



        
        if !@children.include?(node)
            raise "error" 
        else
            node.parent = nil
            @children.delete(node)
        end

    end


end