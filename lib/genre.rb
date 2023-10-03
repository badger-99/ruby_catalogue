class Genre
  attr_reader :name, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_items(item)
    @items.push(item) unless @items.include?(item)
  end
end
