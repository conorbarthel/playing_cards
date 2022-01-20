require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe do
  let(:player) {Player.new}

  it "exists" do
    expect(player).to be_a Player
  end

  it "has a hand" do
    expect(player.hand).to eq []
  end
end
