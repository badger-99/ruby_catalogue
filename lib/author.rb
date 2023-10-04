class Author
  attr_accessor :items
  attr_reader :first_name, :last_name, :id

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.add_author(self)
  end

  def to_hash
    {
      'first_name' => @first_name,
      'last_name' => @last_name
    }
  end
end
