class Pile

  attr_reader :top_card, :bottom_card

  def initialize(top_card=nil)
    @top_card = top_card
    @bottom_card = top_card
  end

  def current_value
    @top_card.value
  end

  def current_color
    @top_card.color
  end

  def valid_play?(card)
    if card.color != current_color && card.value == VALUE_STRINGS[@top_card.value] - 1
      return true
    else
      return false
    end
  end

  def new_top(card)
    @top_card = card
    @current_suit = card.color
  end

end