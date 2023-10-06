require_relative '../lib/author'
require_relative '../lib/item'

RSpec.describe Author do
  author = nil
  item = nil

  before :each do
    item = Item.new('2001-01-01')
    author = Author.new('jk', 'rollin')
    author.add_item(item)
  end

  it 'should add item in author' do
    expect(author.items.length).to be(1)
  end
  it 'should have date as expected' do
    expect(author.items[0].publish_date).to eq(Date.parse('2001-01-01'))
  end
end
