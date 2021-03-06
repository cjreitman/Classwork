class Player
  attr_reader :name, :bankroll
  attr_accessor :hand

  def initialize(name, bankroll)
    @name = name
    @bankroll = bankroll
  end

  def pay_winnings(bet_amt)
    @bankroll += bet_amt
  end

  def return_cards(deck)
    deck.return_cards(hand)
    hand = nil

  end

  def place_bet(dealer, bet_amt)
    if bet_amt <= @bankroll
      dealer.take_bet(bet_amt)
      @bankroll -= bet_amt
    else
      raise "player can't cover bet"
    end
  end
end
