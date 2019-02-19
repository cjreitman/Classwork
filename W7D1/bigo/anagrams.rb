

def first_anagram?(str1, str2)

  strings = str1.split("")
  words = strings.permutation.to_a #O(n!)
  subs = []
  words.each do |word| #O(n)
    subs << word.join("")
  end
  subs.include?(str2) #O(n)

end

#=> O(!n!)

def second_anagram?(str1, str2)
  
  str2_chars = str2.split("")
  str1.each_char do |char|  #O(n)
    idx = str2_chars.index(char)  #O(n)
    str2_chars.delete_at(idx) if !idx.nil? #O(n)
  end
  return str2_chars.empty?
end

#  O(n * 2n) == O(n * n) ==  O(n^2)


def third_anagram?(str1, str2)

  str1.chars.sort == str2.chars.sort
      #sort1            #sort2
end     #2-O(n)            #2-O(n)
#we're not sure how recursion affects the time complexity
#could it be 4-O(n) for each?  1 n for each loop (2x), and 1 n for each recursion (2x)
#O(n + n^2) + O(n + n^2)

def quicksort(arr)

  return arr if arr.length == 1

  pivot_arr = arr.first

  first_half = arr[1..-1].select { |val| val < arr.first }
  second_half = arr[1..-1].select { |val| val >= arr.first }

  return quicksort(first_half) + [pivot_arr] + quicksort(second_half)

end


def fourth_anagram?(str1, str2)

  counter = Hash.new(0)
  str1.each_char do |char|  #O(n)
    counter[char] += 1 
  end

  counter2 = Hash.new(0)
  str2.each_char do |char|  #O(n)
    counter2[char] += 1 
  end

  counter == counter2

end

#O(2n) == O(n)


#BONUS
def fifth_anagram?(str1, str2)

  counter = Hash.new(0)
  str1.each_char.with_index do |char, idx| #O(n)
    counter[char] += 1 
    counter[str2[idx]] -= 1
  end

  counter.values.all? { |v| v == 0  }  #O(n)

end

#O(3n) == O(n)

p fourth_anagram?("elvis", "lives")
p fourth_anagram?("colin", "niloc")
p fourth_anagram?("gizmo", "sally")
