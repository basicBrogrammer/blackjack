# blackjack Game
require "deck"
require "player"
require "betting"
require "dealer"

class  Blackjack
  def initialize
    @deck = Deck.new
    @deck.shuffle!
    @player = Player.new(@deck)
    @dealer = Dealer.new(@deck)
    puts 'Welcome to BlackJack'
    puts
  end

  def compare
    if @player.blackjack
      @player.bet.blackjack
    elsif@player.cards.bust
      puts "You had #{@player.cards.print} which is #{@player.cards.add}"
      puts 'LOSER'
      @player.bet.lose
    elsif @dealer.cards.bust
      puts "You had #{@player.cards.print} which is #{@player.cards.add}"
      puts 'WINNER'
      @player.bet.win
    elsif @player.cards.add > @dealer.cards.add
      puts "You had #{@player.cards.print} which is #{@player.cards.add}"
      puts 'WINNER'
      @player.bet.win
    elsif @player.cards.add < @dealer.cards.add
      puts "You had #{@player.cards.print} which is #{@player.cards.add}"
      puts 'LOSER'
      @player.bet.lose
    else
      puts 'Push'
    end
  end
  def play

    while @player.bet.total > 0
      @player.playing(@deck)
      if @player.cards.bust == false
        @dealer.playing(@deck)
      end
      compare
      puts

    end
  end

end

blackjack = Blackjack.new
blackjack.play
