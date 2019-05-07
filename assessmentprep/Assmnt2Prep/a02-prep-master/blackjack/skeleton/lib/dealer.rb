require_relative 'player'
require "byebug"

class Dealer < Player
  attr_reader :bets, :name

  def initialize

    super("dealer", 0)
    @bets = {}

  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
    
   while !hand.busted?
    break if hand.points >= 17
    hand.hit(deck)
   end

  end

  def take_bet(player, amt)

    @bets[player] = amt
  end

  def pay_bets

    @bets.each do |player, bet|
      debugger
      player.hand
    end

  end
end
