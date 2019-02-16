
require "byebug"

class Array 

  def my_uniq
    counter = Hash.new(0)
    self.each do |e|
      counter[e] += 1
    end
    counter.keys
  end

  def two_sum
    pairs = []
    (0...length - 1).each do |idx1|
      (idx1 + 1...length).each do |idx2|
        pairs << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end  
    pairs
  end

  def my_transpose
    i = 0
    new_arr = []
    while i < self.length
      x = 0
      sub_arr = []
      while x < self.length
        sub_arr << self[x][i]
        x += 1
      end
      new_arr << sub_arr
      i += 1
    end
    new_arr
  end

  # def stock_picker
	# 	#[5, 10, 12, 3]
  #   new_arr = []

	# 	(0...length - 1).each do |day1|
	# 		if new_arr.empty?
	# 			if self[day1 + 1] - self[day1] > 0 
	# 				new_arr.concat([day1, day1 + 1]) 
	# 			end
	# 		else
	# 			if (self[new_arr[-1]] - self[new_arr[-2]]) < (self[day1 + 1] - self[day1])
	# 				new_arr.concat([day1, day1 + 1])
	# 			end
	# 		end

	# 	end
		
	# 	new_arr.empty? ? new_arr : [new_arr[-2], new_arr[-1]]
  
  # end
  
  def stock_picker
    profit = [0, 0]
    i = 0
    while i < self.length
      x = i + 1
      while x < self.length 
        difference = self[x] - self[i]
        current = self[profit[1]] - self[profit[0]]
        if difference > current
          profit[0] = i
          profit[1] = x
        end
        x += 1
      end
      i += 1
    end

    return [] if profit == [0, 0]
    return profit

  end


end