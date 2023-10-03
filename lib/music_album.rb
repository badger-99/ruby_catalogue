require_relative 'item'

class MusicAlbum < Item
  def initialize(title, artist, _genre, spotify: true)
    super()
    @title = title
    @artist = artist
    @on_spotify = spotify
  end
end
