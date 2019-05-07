require "rspec"
require "deck"

describe Deck do 
  describe "::create_deck" do
    subject(:create_deck) {Deck.create_deck}
    it {expect(create_deck.count).to eq(52)}
  
    it "returns all cards without duplicats" do
      deduped_cards = create_deck
      .map { |card| [card.suit, card.value]   }
      .uniq
      .count
    expect(deduped_cards).to eq(52)  
    end
  end

  let(:cards) do
    cards = [
      Card.new(:spades, :king),
      Card.new(:spades, :queen),
      Card.new(:spades, :jack)
    ]
  end

  describe "#initialize" do 

    it "fills itself with 52 cards" do
      deck = Deck.new
      expect(deck.count).to eq(52)
    end

  end

  let(:deck) do
    Deck.new(cards.dup)
  end

  describe "#count" do
    it "should return the number of cards in the deck" do
      deck = Deck.new
      expect(deck.count).to eq(52)
    end
  end

  describe "#take" do
    it "should take the specified number of cards from the deck" do
      expect(deck.take(1)).to eq(cards[0..0])
    end

    it "does not allow you to take more cards than are in the deck" do
      expect do 
        deck.take(4)
      end.to raise_error
    end
  end

  describe "#return" do 
    let(:more_cards) do
      [Card.new(:hearts, :four),
      Card.new(:hearts, :five),
      Card.new(:hearts, :six)]
    end

    it "should return cards to the back of the deck" do
      expect(deck.return(more_cards).count).to eq(6) 
    end
  end
end