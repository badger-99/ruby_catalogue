require_relative '../lib/label'
require_relative '../lib/item'

RSpec.describe Label do
  let(:title) { 'Example Title' }
  let(:color) { 'Blue' }
  let(:item) { Item.new('2022-01-01') }

  describe '#initialize' do
    it 'should initialize a Label object with given parameters' do
      label = Label.new(title, color)

      expect(label.title).to eq(title)
      expect(label.color).to eq(color)
      expect(label.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'should add an item to the label' do
      label = Label.new(title, color)
      label.add_item(item)

      expect(label.items).to include(item)
      expect(item.label).to eq(label)
    end
  end
end