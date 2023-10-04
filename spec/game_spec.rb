require_relative '../lib/game'
require_relative '../lib/author'

RSpec.describe Game do
  game = nil
  author = nil
  before :each do
    author = Author.new('jk', 'rollin')
    game = Game.new(author, '2001-01-01', '2005-01-01', true)
  end
  it 'should implement game with item class' do
    expect(game).to be_a Game
  end
  it 'should match author name' do
    expect(game.author.first_name).to eq('jk')
  end
  it 'should not add same author twice' do
    game.author.add_item(game)
    expect(game.author.items.length).to eq(1)
  end
end
