class Deck
  attr_reader :cards

  def initialize
    @ranks = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
    @suits = %w{♥ ♦ ♠ ♣}
    @cards = @suits.flat_map do |suit|
      @ranks.map do |rank|
        Card.new(rank, suit)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal(num, player)
    num.times do
      player.hand << @cards.shift
    end
  end
end
