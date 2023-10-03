require_relative 'item'
require_relative 'genre'

class MusicAlbum < Item
  attr_reader :title, :artist

  def initialize(date, title, artist, genre, on_spotify: true)
    super(date)
    @title = title
    @artist = artist
    @on_spotify = on_spotify
    add_genre(genre)
  end

  def move_to_archive
    @archived = can_be_archived? && @on_spotify
  end
end

class AlbumManager
  attr_reader :genre_list

  def initialize
    @albumn_list = []
    @genre_manager = GenreManager.new
  end

  def on_spotify?
    spotify = nil
    while spotify.nil?
      print 'Is the album on Spotify? [Y/N]: '
      choice = gets.chomp.downcase
      if choice == 'y'
        spotify = true
      elsif choice == 'n'
        spotify = false
      else
        puts 'Enter a valid choice'
      end
    end
    spotify
  end

  def create_album
    print 'Enter a date [dd-mm-yyy]: '
    date = gets.chomp
    print 'Enter album title: '
    title = gets.chomp
    print 'Enter album artist: '
    artist = gets.chomp
    print 'Enter album genre:'
    genre = @genre_manager.create_genre
    spotify = on_spotify?

    album = MusicAlbum.new(date, title, artist, genre, spotify)
    @genre_manager.add_genre(genre)
    @albumn_list.push(album)
  end

  def show_music_albums
    @albumn_list.each_index do |album, index|
      puts "#{index + 1}. #{album.title} by #{album.artist}"
    end
  end

  def show_album_genres
    array = @genre_manager.genre_list
    @genre_manager.show_genres(array)
  end
end
