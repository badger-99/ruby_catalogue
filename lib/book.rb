require_relative 'item'
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(genre, author, label, date, publisher, cover_state)
    super(date)
    @publisher = publisher
    @cover_state = cover_state
    add_label(label)
    add_author(author)
    add_genre(genre)
    can_be_archived?
  end

  private
  
  def can_be_archived?
    super || cover_state == 'bad'
  end
end
