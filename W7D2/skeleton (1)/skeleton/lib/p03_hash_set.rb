class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if count >= num_buckets
      resize!
    end
    
    bucket_idx = key.hash % num_buckets

    if !@store[bucket_idx].include?(key.hash)
      @store[bucket_idx] << key.hash
      @count += 1  
    end
  end

  def include?(key)
    bucket_idx = key.hash % num_buckets
    @store[bucket_idx].each do |bnum|
      return true if key.hash == bnum
    end
    return false
  end

  def remove(key)
    bucket_idx = key.hash % num_buckets
    @store[bucket_idx].each do |bnum|
      if key.hash == bnum
        @store[bucket_idx].delete(key.hash)
        @count -= 1
      end
    end    
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    bucket_idx = num.hash % self.length
    store[bucket_idx] 
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_mod = num_buckets * 2
    new_store = Array.new(new_mod) { Array.new }
    @store.each do |bucket|
      bucket.each do |ele|
        new_bucket_idx = ele % new_mod
        new_store[new_bucket_idx] << ele
      end
    end
    @store = new_store
  end
end
