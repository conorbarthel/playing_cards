class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @face_up = true
  end

  def show
    if show?
      p "#{@rank}#{@suit}"
    else
      p "☈"
    end
  end

  def show?
    @face_up
  end

  def flip
    if show?
      @face_up = false
    else
      @face_up = true
    end
  end

  def convert
    rank_num = 0
    if @rank == "A"
      rank_num = 1
    elsif @rank == "J"
      rank_num = 11
    elsif @rank == "Q"
      rank_num = 12
    elsif @rank == "K"
      rank_num = 13
    else
      rank_num = @rank.to_i
    end
  end
end
