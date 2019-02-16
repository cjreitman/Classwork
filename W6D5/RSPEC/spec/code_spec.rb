require "code"

describe Array do 
  describe "#my_uniq" do
    subject(:array) { [1, 2, 1, 3, 3] }
    
    it 'removes duplicates' do
      expect(array.my_uniq).to eq([1,2,3])
    end

    it 'should not call #uniq' do
      expect(array).to_not receive(:uniq)
    end

    it "should not modify the original" do
      x = array
      array.my_uniq
      expect(array).to eq(x)
    end
  end

  describe "#two_sum" do
    subject(:array) { [1, 0, 2, -2, -1] }

    it "returns positions of pairs that sum to 0" do
      expect(array.two_sum).to eq([[0, 4],[2, 3]])
    end

    it "returns an empty array if no pairs are found" do
      expect([0,1,2,3,4,5].two_sum).to eq([])
    end

    it "should be in dictionary order" do
      expect(array.two_sum).to eq(array.two_sum.sort)
    end

  end

  describe "#my_transpose" do 
    subject(:array) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }
    
		it "should transpose the array" do
			expect(array.my_transpose).to eq( [[1, 4, 7], [2, 5, 8], [3 ,6, 9]] )
		end

		it "should transpose an array of any number of elements" do
			expect([[1, 2, 3, 13], [4, 5, 6, 14], [7, 8, 9, 15], [10, 11, 12, 16]].my_transpose).to eq([[1, 4, 7, 10], [2, 5, 8, 11], [3 ,6, 9, 12], [13, 14, 15, 16] ])
		end
		
		it "should not call #transpose" do
			expect(array).to_not receive(:transpose)
		end

	end

  describe "#stock_picker" do
    subject(:array) { [1, 10, 5, 12, 3] }

    it "should return the most profitable pair of days" do
      expect(array.stock_picker).to eq([0, 3])
    end

		it "should return an emty array when every day is a losing day" do
			expect([5,4,3,2,1].stock_picker).to eq([])
    end

  end


      
  
end