require_relative 'item'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def to_hash
    {
      'id' => @id,
      'title' => @title,
      'color' => @color,
      'items' => @items.map { |item| item.to_hash }
    }
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
