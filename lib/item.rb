class Item
  attr_accessor :publish_date
  attr_reader :id, :genre, :author, :label, :archived

  def initialize(genre, author, label, date, archived: false)
    @id = Random.rand(1..1000)
    add_genre(genre)
    add_author(author)
    add_label(label)
    @publish_date = Date.git parse_date(date)
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    genre.array.push(self) unless genre.array.include?(self)
  end

  def add_author(author)
    @author = author
    author.array.push(self) unless author.array.include?(self)
  end

  def add_label(label)
    @label = label
    label.array.push(self) unless label.array.include?(self)
  end

  def can_be_archived?
    current_date = Date.today
    current_date - @publish_date >= 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
