require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(genre, author, label, publish_date, archived, last_played_at, multiplayer: false)
    @last_played_at = Date.strptime(last_played_at)
    @multiplayer = multiplayer
    super(genre, author, label, publish_date, archived)
  end

  private

  def can_be_archived?
    super && (Date.today - last_played_at > 2)
  end
end
