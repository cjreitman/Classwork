require "deck"

  def inititialize(deck)

    @piles = []
    @kings_piles = []
    4.times do 
      @piles << Pile.new(deck.take(1))
    end
    4.times do 
       << Pile.new
    end

  end

  def move_pile



  end

  

  
