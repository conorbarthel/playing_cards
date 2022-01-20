require './lib/card'
'♥♦♠♣'
RSpec.describe do
  let(:card) {Card.new("A", "♠︎")}

  it 'exists' do
    expect(card).to be_a Card
  end

  it 'has a suit' do
    expect(card.suit).to eq "♠︎"
  end

  it 'has a rank' do
    expect(card.rank).to eq "A"
  end

  it 'can be displayed' do
    expect(card.show).to eq(puts "A♠︎")
  end

  it 'has a backside' do
    card.flip
    expect(card.show).to eq(puts '☈')
  end

  it 'can be flipped' do
    expect(card.show?).to be true
    card.flip
    expect(card.show?).to be false
    card.flip
    expect(card.show?).to be true
  end

  it "converts face cards to numbers" do
    expect(card.convert).to eq(1)
  end
end
