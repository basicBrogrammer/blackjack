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

# The following method "compare" uses if logic to decide whether the player or dealer wins
  def compare
    if @player.blackjack
      @player.bet.blackjack
    elsif@player.cards.bust
      puts
      puts "You busted!"
      puts "You had #{@player.cards.print} which is #{@player.cards.add}"
      puts 'LOSER'
      @player.bet.lose
    elsif @dealer.cards.bust
      puts
      puts "You had #{@player.cards.print} which is #{@player.cards.add}"
      puts "Dealer had #{@dealer.cards.print} which is #{@dealer.cards.add}"
      puts 'WINNER'
      @player.bet.win
    elsif @player.cards.add > @dealer.cards.add
      puts
      puts "You had #{@player.cards.print} which is #{@player.cards.add}"
      puts "Dealer had #{@dealer.cards.print} which is #{@dealer.cards.add}"
      puts 'WINNER'
      @player.bet.win
    elsif @player.cards.add < @dealer.cards.add
      puts
      puts "You had #{@player.cards.print} which is #{@player.cards.add}"
      puts "Dealer had #{@dealer.cards.print} which is #{@dealer.cards.add}"
      puts 'LOSER'
      @player.bet.lose
    else

      puts 'Push'
    end
  end

# play: Calls the @player.playing method which goes through the playing logic for the player. Similarly,
#the @dealer.playing method goes through the logic to automate the dealers play.
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
