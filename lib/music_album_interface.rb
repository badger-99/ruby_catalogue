require_relative 'music_album'
require_relative 'genre_interface'

class AlbumInterface
  def initialize
    @albumn_list = []
    @genre_interface = GenreInterface.new
  end

  def create_album
    print 'Enter a date [DD-MM-YYYY]: '
    date = gets.chomp

    until date.match?(/\A\d{2}-\d{2}-\d{4}\z/) && date != '00-00-0000'
      puts "\nEnter a valid date in the shown format."
      date = gets.chomp
    end

    print 'Enter album title: '
    title = gets.chomp
    print 'Enter album artist: '
    artist = gets.chomp
    genre = @genre_interface.create_genre
    on_spotify = on_spotify?

    album = MusicAlbum.new(date, title, artist, genre, on_spotify)
    @albumn_list.push(album)
  end

  def show_music_albums
    if @albumn_list.empty?
      puts 'There are no albums in the collection.'
    else
      @albumn_list.each_with_index do |album, index|
        puts "#{index + 1}. #{album.title} by #{album.artist}"
      end
    end
  end

  def show_album_genres
    array = @genre_interface.genre_list
    if array.empty?
      puts 'There are no recorded Genres in the collection'
    else
      @genre_interface.show_genres(array)
    end
  end

  private

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
end
