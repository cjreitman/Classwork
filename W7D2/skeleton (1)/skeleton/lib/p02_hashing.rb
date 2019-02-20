class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    total_sum = 0
    self.each_with_index do |ele, idx|
      total_sum += (ele * idx)
    end
    total_sum.hash
  end
end

class String
  def hash
    total_sum = 0
    alpha = ('a'..'z').to_a
    self.each_char.with_index do |ch, idx|
      total_sum += (idx * alpha.index(ch.downcase))
    end
    total_sum.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    
    sym_idx = (:a..:z).to_a
    total_sum = 0
    i = 0
    while i < self.keys.length
      total_sum += (sym_idx.index(self.keys[i]) * self.values[i].hash)
      i += 1
    end
    total_sum.hash
  end
end
