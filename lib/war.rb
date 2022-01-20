require './lib/deck'
require './lib/player'
require 'pry'
class War
  attr_reader :spoils, :deck, :user, :cpu

  def initialize
    @deck = Deck.new
    @user = Player.new
    @cpu = Player.new
    @spoils = []
  end

  def play
    deck.shuffle
    deck.deal(26, @user)
    deck.deal(26, @cpu)
    until @user.hand == 0 || @cpu.hand == 0
      battle(@user, @cpu)
    end
  end

  def game_over
    if @user.hand == 0
      puts "You lose, I am the greatest general of all time!!!!!!"
    elsif @cpu.hand == 0
      puts "I lost, you just got lucky"
    end
    system('clear')
  end

  def message(player_card, cpu_card)
    if player_card.convert < cpu_card.convert
      p "I win"
    elsif player_card.convert > cpu_card.convert
      p "You win"
    elsif player_card.convert == cpu_card.convert
      p "Tie, time to go to war"
    end
  end

  def win?(player_card, cpu_card)
    if player_card.convert < cpu_card.convert
      false
    elsif player_card.convert > cpu_card.convert
      true
    # else player_card.convert == cpu_card.convert
    #   go_to_war(player_1, player_2)
    end
  end

  def battle(player_1, player_2)

    return game_over if player_1.hand == 0 || player_2.hand == 0
    p_1_card = player_1.hand.shift
    p_2_card = player_2.hand.shift
    # p_1_card.show
    # p_2_card.show
    @spoils << p_1_card
    @spoils << p_2_card
    # message(p_1_card, p_2_card)
    if win?(p_1_card, p_2_card) == false
      get_spoils(player_2)
      player_2.hand.flatten!
      @spoils = []
      # puts "My deck #{player_2.hand.size}"
      # puts "Your deck #{player_1.hand.size}"
    elsif win?(p_1_card, p_2_card)
      get_spoils(player_1)
      player_1.hand.flatten!
      @spoils = []
      # puts "My deck #{player_2.hand.size}"
      # puts "Your deck #{player_1.hand.size}"
    else
      go_to_war(player_1, player_2)
    end
  end

  def go_to_war(player_1, player_2)
    w_1_card = player_1.hand.shift
    w_2_card = player_2.hand.shift
    w_1_card.flip
    w_2_card.flip
    # w_1_card.show
    # w_2_card.show
    @spoils << w_1_card
    @spoils << w_2_card
    battle(player_1, player_2)
    # binding.pry
  end

  def get_spoils(player)
    (player.hand << @spoils).flatten
  end

  def pause
    pause = gets.chomp
  end
end
