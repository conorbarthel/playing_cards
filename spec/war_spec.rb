require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/war'
'♥♦♠♣'

RSpec.describe do
  let(:a_spade) {Card.new("A", "♠")}
  let(:four_spade) {Card.new(4, "♠")}
  let(:j_spade) {Card.new("J", "♠")}
  let(:k_spade) {Card.new("K", "♠")}
  let(:deck) {Deck.new}
  let(:player) {Player.new}
  let(:cpu) {Player.new}
  let(:war) {War.new}

  it "exists" do
    expect(war).to be_a War
  end

  it "each player has 26 cards" do
    deck.deal(26, player)
    deck.deal(26, cpu)
    expect(player.hand.size).to eq 26
    expect(cpu.hand.size).to eq 26
  end

  it "knows card ranks" do
    expect(war.determine(a_spade, four_spade)).to eq(puts "I win")
  end

  it "one card is played from each hand" do
    war.draw
  end

end
