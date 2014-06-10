# dealer
# contains all the logic for the dealers play to be automatic
class Dealer

  attr_accessor :cards, :bet, :move
  def initialize(deck)
    @cards = Hand.new
    @move = 'h'
    @bet = Betting.new
  end

  def deal_player(deck)
    @cards.hand =[]
    @cards.ace = false
    2.times {@cards.hit(deck)}
  end

# This method allows the dealers play to be automated. The dealer hits if Hand.add ( the sum of the cards in hand)
# is less than 17
  def hit_or_stay(deck)

    if @cards.add <17
      puts 'Dealer Hits'
      @move = 'h'
      @cards.hit(deck)
    else
      @move = 's'
      puts 'Dealer Stands'
    end
  end

# Plays through the dealers moves. Prints his hand after every hit, prints when the dealer bust
  def playing(deck)
    deal_player(deck)
    @move = 'h'
    while @move == 'h'
      @cards.dealer_hand
      hit_or_stay(deck)
      @cards.add
      if @cards.bust
        @cards.print_hand
        puts "Dealer busted!"
        @move = 's'
      end
    end
  end

end
