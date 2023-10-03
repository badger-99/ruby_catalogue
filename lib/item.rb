class Item
  attr_accessor :publish_date
  attr_reader :genre

  def initialize(date)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse_date(date)
    @archived = false
    @genre = nil
  end

  def add_genre(genre)
    @genre = genre
    genre.add_items(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    current_date = Date.today
    current_date - @publish_date >= 10
  end
end
