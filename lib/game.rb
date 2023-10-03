require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(author, publish_date, last_played_at, multiplayer)
    super(publish_date)
    @last_played_at = Date.strptime(last_played_at)
    @multiplayer = multiplayer
    add_author(author)
  end

  private

  def can_be_archived?
    super && (Date.today - last_played_at > 2)
  end
end
