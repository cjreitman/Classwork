class Hand
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
    @cards.each do |card|
      if card.value != :ace
        points += card.blackjack_value
      end

      if card.value == :ace && points <= 10
        points += 11
      elsif card.value == :ace && points > 10
        points += 1
      end
    end
    points
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1) 
  end

  def beats?(other_hand)
    return false if busted?

    other_hand.busted? || points > other_hand.points

  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
