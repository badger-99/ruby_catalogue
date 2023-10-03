require_relative 'item'

class MusicAlbum < Item
  def initialize(date, title, artist, genre, on_spotify: true)
    super(date)
    @title = title
    @artist = artist
    @on_spotify = on_spotify
    add_genre(genre)
  end
  end
end
