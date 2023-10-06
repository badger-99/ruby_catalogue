class Genre
  attr_reader :name, :items
  attr_accessor :id

  def initialize(name = 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_items(item)
    @items.push(item) unless @items.include?(item)
    item.add_genre(self)
  end

  def to_hash
    {
      'id' => @id,
      'name' => @name
    }
  end
end
