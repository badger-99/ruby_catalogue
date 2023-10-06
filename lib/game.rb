require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :hash

  def initialize(author, publish_date, last_played_at, multiplayer)
    super(publish_date)
    @last_played_at = Date.strptime(last_played_at)
    @multiplayer = multiplayer
    add_author(author)
  end

  def to_hash
    {
      'author' => {
        'first_name' => author.first_name,
        'last_name' => author.last_name
      },
      'publish_date' => publish_date.to_s,
      'last_played_at' => last_played_at,
      'multiplayer' => multiplayer
    }
  end

  private

  def can_be_archived?
    super && (Date.today - last_played_at > 730)
  end
end
