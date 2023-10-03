  def initialize(genre, author, label, publish_date, archived, last_played_at, multiplayer: false)
    @last_played_at = Date.strptime(last_played_at)
    @multiplayer = multiplayer
    super(genre, author, label, publish_date, archived)
  end
