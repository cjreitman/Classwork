#returns all subsets of an array
def subsets(array)

end

# Using recursion and the is_a? method,
# write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

def deep_dup(arr)

  new_array = []

  arr.each do |ele|
    if ele.is_a?(Array)
      new_array << deep_dup(ele)
    else
      new_array << ele
    end
  end
  return new_array

end

# Write a recursive method that returns all of the permutations of an array
def permutations(array)
end

class Array

  def my_join(str = "")

    new_str = ""
    self.each_with_index do |char, idx|
      new_str << char
      new_str << str unless idx >= self.length - 1
    end

    return new_str

  end

end

class Array

  def my_reverse

    return self[0] if self.length <= 1

    reversed = [self[0]]
    reversed.unshift(self[1..-1].my_reverse).flatten

  end

end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings

    subs = []

    i = 0
    while i < self.length

      x = i

      while x < self.length

        subs << self[i..x]
        x += 1
      end
      i += 1
    end
    subs.select {|sub| sub.reverse == sub && sub.length > 1  }
  end
end

class Array

  def my_reject(&prc)

    accepted = []
    self.each do |ele|
      accepted << ele if !prc.call(ele)
    end
    accepted
  end

end

class Array

  def my_zip(*arrs)

    i = 0
    zipped = []
    while i < self.length
      subs = [self[i]]

      arrs.each do |arr|
        subs << arr[i]
      end
      i += 1
      zipped << subs
    end
    zipped
  end
  
end

class Array

  def my_all?(&prc)

    self.each do |ele|
      if !prc.call(ele)
        return false
      end
    end
    true
  end

end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)

  alphabet ||= "abcdefghijklmnopqrstuvwxyz"

  sorted = false
  i = 0
  while !sorted
    sorted = true

    while i < str.length - 1
      if alphabet.index(str[i]) > alphabet.index(str[i + 1])
        str[i], str[i + 1] = str[i + 1], str[i]
        sorted = false
      end
      i += 1
    end
  end
str
end

class Array
  def bubble_sort!(&prc)

    prc ||= Proc.new { |x, y|  x <=> y  }
    sorted = false
    while !sorted
      i = 0
      sorted = true

      while i < self.length - 1
        if prc.call(self[i], self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
        i += 1
      end
      
    end
    return self
  end

  def bubble_sort(&prc)

    duped = self.dup

    duped.bubble_sort!(&prc)

  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

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

    until right.empty? || left.empty?
      if prc.call(left.first, right.first) == 1
        merged_array << right.shift
      else
        merged_array << left.shift
      end
    end

    return merged_array + left + right

  end
end

