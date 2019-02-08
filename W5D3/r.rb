require 'byebug'

def range(start, last)
    return [start] if start == last - 1
    nums_in_range = [start]
    nums_in_range += range(start + 1, last) 
end

def range_itr(start, last)
    retrunarr = []
    (start...last).each do |ele|
        retrunarr << ele
    end
retrunarr
end

def expo(base, exp)
    return 1 if exp == 0
    return base if exp == 1
    base * expo(base, exp - 1)
end

def expo2(base, exp)
    return 1 if exp == 0
    return base if exp == 1

    if exp.even? 
       return expo2(base, exp / 2) * expo2(base, exp / 2)
    else
       return base * (expo2(base, (exp - 1) / 2)) * (expo2(base, (exp - 1) / 2))
    end

end


class Array
    def deep_dup
        copy = []
        self.each do |ele|
            if ele.is_a?(Array)
                copy << ele.deep_dup
            else
                copy << ele.dup
            end
        end
        copy
    end
end



def fibo(n)
    return [0, 1].take(n) if n <= 2
    last_fibs = fibo(n - 1)
    last_fibs << (last_fibs[-1] + last_fibs[-2])
end

def fibo_itr(n)
    return [0, 1].take(n) if n <= 2
    
    fibs = [0, 1]

    while fibs.length < n
        next_num = fibs[-1] + fibs[-2]
        fibs << next_num
    end

fibs
end

def binarysearch(sortedarr, target)
  
    midpoint = sortedarr.length / 2

    if sortedarr[midpoint] == target
        return midpoint
    else 
        if sortedarr[midpoint] > target 
            return binarysearch(sortedarr[0...midpoint], target)
        else
            ele = binarysearch(sortedarr[midpoint..-1], target)
            return sortedarr[0...midpoint].length + ele
        end
        
    end

    return nil
    
end



class Array

    def merge_sort

        return self if self.length < 2

        middle_idx = self.length / 2

        lower = self[0...middle_idx] 
        upper = self[middle_idx..-1]

        merge_1 = lower.merge_sort
        merge_2 = upper.merge_sort

        return merge(merge_1, merge_2)

    end

    def merge(el1, el2)
        
        new_array = [el1, el2].flatten
        i = 0

        while i < new_array.length - 1
            if new_array[i] > new_array[i + 1]
                new_array[i], new_array[i + 1] = new_array[i + 1], new_array[i]
            end
            i += 1
        end

        new_array

    end


end


def subsets(arr)

    return [arr] if arr.length == 0
    return [[], arr] if arr.length == 1
    
    subs = subsets(arr[0..-2])


    values =  subs.each do |subarr|
        subarr << arr[-1]
    end

    return [[], [1], *values]

end

p subsets([])
p subsets([1])

p subsets([1,2])
p subsets([1,2,3])








