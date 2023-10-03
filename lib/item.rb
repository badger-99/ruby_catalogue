class Item
  attr_accessor :publish_date
  attr_reader :id, :genre, :author, :label, :archived

  def initialize(genre, author, label, date, archived: false)
    @id = Random.rand(1..1000)
    add_genre(genre)
    add_author(author)
    add_label(label)
    @publish_date = Date.parse_date(date)
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def can_be_archived?
    current_date = Date.today
    current_date - @publish_date >= 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
