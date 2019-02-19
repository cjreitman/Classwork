

def bad_two_sum?(arr, target)

  (0..arr.length - 1).each do |i|
    (i + 1..arr.length - 1).each do |j|
      return true if arr[i] + arr[j] == target
    end
  end
  return false
end

#O(n^2) - returning the boolean early doesn't do anything to the nested loop situation, which is where the bulk of the time complexity is derived 

# p bad_two_sum?([7, 6, 6, 7], 14)


def okay_two_sum?(arr, target)

  arr.sort
  i = 0 
  j = arr.length
  until arr[i] + arr[j] == target || i == arr.length - 1
    return true 
  end

  return false
  

end

p okay_two_sum?([7, 6, 6, 7], 14)