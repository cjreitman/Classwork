require "byebug"

class Hand

  BLACKJACK_VALUE = {
    :deuce => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 10,
    :queen => 10,
    :king  => 10
  }

  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
   Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    points = 0
    # debugger
    @cards.each do |card|
    if card != nil
       if card.suit != :ace
        points += BLACKJACK_VALUE[card.value]
      elsif (card.suit == :ace) && points <= 10
        points += 11 
      elsif (card.suit == :ace) && points > 10
        points += 1
      end
    end
    end
    points
  end

  def busted?
    if points > 21
      return true
    else
      return false
    end
  end

  def hit(deck)
    if !busted?
      return deck.take(1)
    else
      raise "already busted"
    end

  end

  def beats?(other_hand)
    if self.points > other_hand.points
      return true
    else
      return false
    end
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
