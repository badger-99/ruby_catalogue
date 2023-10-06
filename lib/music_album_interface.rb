require 'json'
require_relative 'music_album'
require_relative 'genre_interface'

class AlbumInterface
  def initialize
    @albumn_list = []
    @genre_interface = GenreInterface.new
  end

  def create_album
    print 'Enter a date [YYYY-MM-DD]: '
    date = gets.chomp

    until date.match?(/\A\d{4}-\d{2}-\d{2}\z/) && date != '00-00-0000'
      puts "\nEnter a valid date in the shown format."
      date = gets.chomp
    end

    print 'Enter album title: '
    title = gets.chomp
    print 'Enter album artist: '
    artist = gets.chomp
    puts 'Enter the genre (press ENTER if you don\'t know it): '
    name = gets.chomp.capitalize
    genre = @genre_interface.create_genre(name)
    on_spotify = on_spotify?

    album = MusicAlbum.new(date, title, artist, genre, on_spotify)
    @albumn_list.push(album)
    puts 'Album saved.'
  end

  def show_music_albums
    if @albumn_list.empty?
      puts 'There are no albums in the collection.'
    else
      @albumn_list.each_with_index do |album, index|
        puts "#{index + 1}. \"#{album.title}\" by #{album.artist}"
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

  def save_genres_and_albums_to_file
    @genre_interface.save_genres_to_file
    album_data = @albumn_list.map(&:to_hash)
    File.open('music_albums.json', 'w') do |file|
      file.puts JSON.generate(album_data)
    end
  end

  def load_genres_and_albums_from_file
    @genre_interface.load_genres_from_file

    return if File.size?('music_albums.json').nil?

    JSON.parse(File.read('music_albums.json')).each do |album_hash|
      id = album_hash['id']
      date = album_hash['date']
      title = album_hash['title']
      artist = album_hash['artist']
      genre_name = album_hash['genre_name']
      on_spotify = album_hash['on_spotify']

      genre = @genre_interface.genre_list.find { |item| item.name == genre_name }
      album = MusicAlbum.new(date, title, artist, genre, on_spotify)
      album.id = id
      @albumn_list.push(album)
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
