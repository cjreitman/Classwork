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
    count = 0
    @cards.each do |card|
      if card.value != :ace
        count += BLACKJACK_VALUE[card.value]
      elsif card.value == :ace
        if count > 10
          count += 1
        elsif count <= 10
          count += 11
        end
      end
    end
    count
  end

  def busted?
    
    if self.points > 21
      true
    else
      false
    end 

  end

  def hit(deck)

    if !busted?
      @cards += deck.take(1)
    else
      raise "already busted"
    end
    @cards
  end

  def beats?(other_hand)

    return false if self.busted?

    if self.points > other_hand.points || other_hand.busted?
      return true
    elsif self.points <= other_hand.points
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
