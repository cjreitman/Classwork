require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket_idx = key.hash % num_buckets
    @store[bucket_idx].each do |node|
      return true if key == node.key
    end
    return false
  end

  def set(key, val)
    if count >= num_buckets
      resize!
    end
    
    bucket_idx = key.hash % num_buckets
    # debugger
    if @store[bucket_idx].include?(key)
      @store[bucket_idx].update(key, val)
    else
      @store[bucket_idx].append(key, val)
      @count += 1  
    end    
  end

  def get(key)
    # bucket_idx = key.hash % num_buckets
    # @store[bucket_idx].each do |node| 
    #   return node.val if node.key == key
    # end
    # nil

    bucket(key).get(key) 
    # this return a value
  end

  def delete(key)
    bucket = bucket(key)
    if bucket
      bucket.remove(key) 
      @count -= 1
    end


    # node_val = self[bucket_idx]
    # if node_val
    #   @store[bucket_idx].each do |n| 
    #     n.remove if n.key == key
    #   end
      # bucket.remove(key)
      # debugger
      # return key
    #end
    nil
  end

  def each(&prc)
    @store.each do |ll|
      ll.each do |node|
        prc.call(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_mod = num_buckets * 2
    new_store = Array.new(new_mod) { LinkedList.new }
    @store.each do |ll|
      ll.each do |node|
        new_bucket_idx = node.key.hash % new_mod
        new_store[new_bucket_idx].append(node.key, node.val)
      end
    end
    @store = new_store
  end    

  def bucket(key)
    @store[key.hash % num_buckets]
  end
  
end
