
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]



def my_min(arr)

  min = 0

  (0..arr.length - 1).each do |i|
    
    (i + 1..arr.length - 1).each do |j|

      if arr[i] < arr[j] && arr[i] < min
        min = arr[i]
      elsif arr[j] < arr[i] && arr[j] < min
        min = arr[j]
      end

    end

  end
  min
end

# Time-Complexity = O(n^2)


def my_min2(array)

  min = 0  
  i = 0

  while i < array.length

   if array[i] < min
      min = array[i]
   end

    i += 1

  end

  return min

end

#Time-complexity is 0(n)

#Largest Contiguous Subsum 

def subs_sums(arr)
  new_arr = []
  i = 0 
  while i < arr.length 
    x = i 
    sub_arr = []

    while x < arr.length 
      sub_arr << arr[i..x]
      x += 1
    end
    new_arr += sub_arr
    i += 1 
  end

  big = arr.min 

  new_arr.each do |sub_arr|
    
    if sub_arr.sum > big
      big = sub_arr.sum
    end
  end
  big
end

#O(n^2 * n)

def single(arr)
  
  current = 0
  largest = 0
  i = 0
  while i < arr.length 
    
    if arr[i] > 0 
      current += arr[i] 
    elsif arr[i] < 0
      current = 0
    end

    if current > largest 
      largest = current 
    end
    i += 1
  end
  largest 
end

#O(n)

p single([-5, -1, -3])
p [2, 3, -6, 7, -6, 7].sum