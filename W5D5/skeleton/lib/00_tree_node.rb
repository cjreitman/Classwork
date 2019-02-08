

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
  end

  def dfs(target)
    return nil if self.nil?
    return self if self.value == target

      self.children.each do |child|
        result = child.dfs(target)
        return result unless result.nil?
      end
    
    nil

  end

  def bfs(target)

    queue = [self]

    while !queue.empty?
        child = queue.shift
        return child if child.value == target
        queue.concat(child.children)
    end
    
    nil

  end

end