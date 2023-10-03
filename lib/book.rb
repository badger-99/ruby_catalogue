require_relative 'item'
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(genre, author, label, date, publisher, cover_state, archived: false)
    super(genre, author, label, date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
