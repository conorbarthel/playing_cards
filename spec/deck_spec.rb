require './lib/deck'
require './lib/card'
require './lib/player'
'♥♦♠♣'
RSpec.describe do
  let(:deck) {Deck.new}
  let(:player) {Player.new}

  it 'exists' do
    expect(deck).to be_a Deck
  end

  it 'cards are card objects' do
    expect(deck.cards.sample).to be_a Card
  end

  it 'has 52 cards' do
    expect(deck.cards.size).to eq 52
  end

  it 'can deal' do
    deck.deal(7, player)
    expect(player.hand.size).to eq 7
    expect(deck.cards.size).to eq 45
  end

end
