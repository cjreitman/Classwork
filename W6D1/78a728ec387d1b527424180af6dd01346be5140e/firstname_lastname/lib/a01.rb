require "byebug"

class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  def merge_sort(&prc)

    return self if self.length <= 1

    probe = self.length / 2

    left = self.take(probe)
    right = self.drop(probe)

    left_sorted = left.merge_sort(&prc)
    right_sorted = right.merge_sort(&prc)

    Array.merge(left_sorted, right_sorted, &prc)

  end

  private
  def self.merge(left, right, &prc)

    prc ||= Proc.new { |x, y|  x <=> y  }

    merged_array = []

    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == 1
        merged_array << right.shift
      else
        merged_array << left.shift
      end
    end

    return merged_array + left + right

  end

end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)

    pairs = []
    (0...self.length).each do |i|
      (i + 1...self.length).each do |j|
        pairs << [i, j] if self[i] + self[j] == target
      end
    end
    return pairs

  end
end

class Array
  # Write a method that flattens an array to the specified level. If no level
  # is specified, it should entirely flatten nested arrays.

  # Examples:
  # Without an argument:
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten = ["a", "b", "c", "d", "e"]

  # When given 1 as an argument:
  # (Flattens the first level of nested arrays but no deeper)
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]]

  def my_flatten(level=nil)

    if level != nil
    return self if level < 1
    
    new_array = []
    self.each do |ele|
      if ele.is_a?(Array) 
        new_array += ele.my_flatten(level - 1)
      else
        new_array << ele
      end
    end
    return new_array

  else
    new_array = []
    self.my_each do |el|
     if el.is_a?(Array) 
        new_array += el.my_flatten
     else
        new_array << el
     end
    end
    new_array
  end
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns all
  # substrings which are equal to their reverse image ("abba" ==
  # "abba"). We should only include substrings of length > 1.

  def symmetric_substrings

    i = 0
    subs = []
    while i < self.length 

      x = i

      while x < self.length

        subs << self[i..x]
        x += 1
      end

      i += 1
    end

    subs.select { |sub|  sub.reverse == sub && sub.length > 1   }

  end
end

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

# Write a method that returns the nth prime number
def nth_prime(n)
  return nil if n == 0

  primes = []
  i = 0

  while primes.length < n

    primes << i if is_prime?(i)
    i += 1
  end

  return primes[-1]

end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)

    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write an array method that returns an array made up of the
  # elements in the array that return `true` from the given block
  def my_select(&prc)

    new_array = []
    self.each do |ele|
      new_array << ele if prc.call(ele)
    end
    new_array

  end
end

