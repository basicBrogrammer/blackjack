# Hand
require 'deck'
class Hand
  attr_accessor :hand, :print, :sum, :bust, :ace

  def initialize
    @hand = []
    @ace_hand = []
    @bust = false
    @ace = false
  end

  def hit(deck)
    @new_card = deck.draw
    @hand << @new_card
  end

  def ace
    if @new_card.rank == :A
      @ace = true
    end
  end

  def print_hand
    @print = @hand.map { |x| x.print_card }
    puts "You have a hand of #{@print.to_s} which is #{add}"
  end

  def dealer_hand
    @print = @hand.map { |x| x.print_card }
    puts "Dealer has #{@print.to_s} which is #{add}"
    add
  end

  def add
    @rank_array = @hand.map{|x| x.rank_values}
    @sum = @rank_array.inject(0) { |sum, element| sum + element}
    bust
    if @bust && @ace
      @sum -= 10
      @bust = false
    end
    @sum.to_i

  end

  def bust
    if @sum > 21
      @bust = true
    else
      @bust =false
    end
  end

end
