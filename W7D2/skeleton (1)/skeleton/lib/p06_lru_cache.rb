require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require "byebug"

class LRUCache
  def initialize(max, prc = Proc.new { |i| i ** 2 })
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      node = @map[key]
      update_node!(node)
      node.val
    else
      calc!(key)
    end
  end

  # def get(key)
  #   # debugger
  #   val = @map[key]
  #   if val 
  #      # => gonna be a linked list
  #     list.each do |node| 
  #       if node.key == key
  #         debugger
  #         update_node!(node)
  #         return node.val
  #       end
  #     end
  #   end

    # calc!(key)
    # return @map[key]
    
  # end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # debugger
    val = @prc.call(key)
    new_node = @store.append(key, val)
    @map.set(key, new_node)
    eject! if count > @max
    val
    # suggested helper method; insert an (un-cached) key
  end

  # def calc!(key)
  #   val = self.prc.call(key)
  #   new_node = store.append(key, val)
  #   map[key] = new_node

  #   eject! if count > self.max
  #   val
  # end

  # def update_node!(node)
  #   # debugger
  #   node.remove
  #   @store.append(node.key, node.val)
  #   @map.set(node.key, @store.last.val)
  #   # suggested helper method; move a node to the end of the list
  # end

  def update_node!(node)
    node.remove
    @map[node.key] = @store.append(node.key, node.val)
  end


  def eject!
    temp = @store.first.key
    @store.remove(temp)
    @map.delete(temp)
  end
end


