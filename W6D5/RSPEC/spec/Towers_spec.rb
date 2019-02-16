require 'byebug'
require 'Towers'

describe Tower do

  subject(:tower) { Tower.new }
  
	it "#initialize" do
		expect(tower).to be_a(Tower)
	end

	it "sets tower to 2D array with 3 disks in the first subarray" do
		expect(tower.stacks).to eq([ [3,2,1], [], [] ])
    end

  describe "#moving_piece" do 

    it "should recieve a valid argument and raises an error" do
        expect {tower.moving_piece(5) }.to raise_error("Must select a valid, non-empty stack")
    end
    it "should select a non-empty stack" do
        expect {tower.moving_piece(1) }.to raise_error("Must select a valid, non-empty stack")
    end
    it "removes the last piece of the selected array" do
        expect(tower.moving_piece(0)).to eq(1)
    end

	end
	
	
    
  describe "#move" do
  
  
    # context "when tower is played, baby" do

      it "only places a disk on the back of the selected array" do
        expect(tower.move(0, 2)).to eq([ [3,2], [], [1] ])
      end

      it "allows disks to move to an empty array" do
        expect(tower.move(0, 2)).to eq([ [3,2], [], [1] ])
      end
      it "raises an error if move is invalid" do
      end
      it "raises an error if you try to put a larger disk on a smaller disk" do 
      end

    # end
  end

end
