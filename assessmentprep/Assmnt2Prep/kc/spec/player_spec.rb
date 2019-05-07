require "player"
require "hand"
require "byebug"

describe Player do

  describe "::initialize" do

    let(:deck) { double("deck") }
    let(:player) { Player.new("Mashu", deck) }
    
    before do 
      allow(deck).to receive(:take).with(7)
    end

    it "sets a hand" do
      expect(player.hand).to be_a(Hand)
    end

    it "sets a name" do 
      expect(player.name).to eq("Mashu")
    end

  end

end
