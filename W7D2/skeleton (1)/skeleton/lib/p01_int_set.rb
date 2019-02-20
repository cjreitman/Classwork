require "byebug"
class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

   
  private

  def is_valid?(num)
    if !validate!(num)
      return false
    else
      return true
    end
  end

  def validate!(num)
    raise "Out of bounds" if num > @max || num < 0
  end
end


class IntSet

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket_idx = num % num_buckets
    @store[bucket_idx] << num
    return true
  end

  def remove(num)
    bucket_idx = num % num_buckets
    @store[bucket_idx].each do |bnum|
      @store[bucket_idx].delete(num) if num == bnum
    end
    
  end

  def include?(num)
    bucket_idx = num % num_buckets
    @store[bucket_idx].each do |bnum|
      return true if num == bnum
    end
    return false
  end

  private

  def [](num)
    bucket_idx = num % self.length
    store[bucket_idx] 
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if count >= num_buckets
      resize!
    end
    
    bucket_idx = num % num_buckets

    if !@store[bucket_idx].include?(num)
      @store[bucket_idx]<< num
      @count += 1  
    end
     
  end

  def remove(num)
    bucket_idx = num % num_buckets
    @store[bucket_idx].each do |bnum|
      if num == bnum
        @store[bucket_idx].delete(num)
        @count -= 1
      end
    end
        
  end

  def include?(num)
    bucket_idx = num % num_buckets
    @store[bucket_idx].each do |bnum|
      return true if num == bnum
    end
    return false
  end

  private

  def [](num)
    bucket_idx = num % self.length
    store[bucket_idx] 
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_mod = num_buckets * 2
    new_store = Array.new(num_buckets * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |ele|
        new_bucket_idx = ele % new_mod
        new_store[new_bucket_idx] << ele
      end
    end
    @store = new_store
  end
end
