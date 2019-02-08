require 'byebug'

# [].my_inject(3) { |acc, num | acc * num   }

class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    
    if accumulator == nil 
      accumulator = self[0]

    end
  

    self.each do |ele|
      accumulator = prc.call(accumulator, ele)
    end

    return accumulator

  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)

  if num < 2
    return false 
  end

  (2...num).each do |int|
    if num % int == 0
      return false
    end

  end

  return true

end

def primes(num)

  i = 0
  primes = []

  while primes.length < num

    if is_prime?(i)
      primes << i
    end

    i += 1
  end

  return primes



end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)



end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups

    indices = Hash.new {  |h, k|  h[k] = []   }

    self.each_with_index do |num, idx|
      indices[num] << idx
    end

    return indices.select { |k, v|  v.count > 1 }
        
  end

end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings

    sub_strings = []
    i = 0

    while i < self.length

      x = i

      while x < self.length
        
        sub_strings << self[i..x]
        x += 1
      end

      i += 1

    end

    return sub_strings.select { |sub| sub.reverse == sub && sub.length > 1 }

  end


end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
  end

  private
  def self.merge(left, right, &prc)
  end
end
