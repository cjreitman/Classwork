require "byebug"

class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end

        self
    end 
    
    def my_select(&prc)

        new_array = []

        self.my_each do |ele|
            if prc.call(ele)
                new_array << ele
            end
        end
        
        return new_array

    end

    def my_reject(&prc)

        new_array = []

        self.my_each do |ele|
            if !prc.call(ele)
                new_array << ele
            end
        end
        
        return new_array

    end

    def my_any?(&prc)

        self.my_each do |ele|
            if prc.call(ele)
                return true
            end
        end
        
        return false

    end

    def my_all?(&prc)

        self.my_each do |ele|
            if !prc.call(ele)
                return false
            end
        end
        
        return true

    end

    def my_flatten

        array = Array.new()

        self.my_each do |ele|

            if ele.is_a?(Array)
                array += ele.my_flatten
            else
                array << ele
            end

        end

        array

    end

    def my_zip(*arrays)

        new_arr = []

        self.length.times do |x|

            sub_arr = [self[x]]
            
            arrays.each { |arr| sub_arr << arr[x] }
            
            new_arr << sub_arr
        end
        
        new_arr
    end

    def my_rotate(rotate=1)

        if rotate > 0
            rotate.times do 
                self.push(self.shift)
            end
        elsif rotate < 0
            p_rotate = rotate.abs
            p_rotate.times do 
                self.unshift(self.pop)
            end
        end

        return self
    end

    def my_join(separator="")
        
        arr = ""

        self.each_with_index do |ele, i| 
            if i < self.length - 1
                arr << ele + separator
            else
                arr << ele
            end    
        end

        arr

    end


    def my_reverse
        
        array = []

        i = self.length - 1

        while i >= 0
            array << self[i]
            i -= 1
        end

        array
    end

end


p ["a", "b", "c", "d"].my_reverse



