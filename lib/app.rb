require 'date'
require_relative 'author'
require_relative 'game'
require_relative 'book'
require_relative 'label'
require_relative 'music_album_interface'
require_relative 'file_io'

class App < FileIO
  attr_accessor :games, :authors, :books, :labels

  def initialize
    @games = game_from_json('game.json')
    @authors = author_from_json('author.json')
    @books = []
    @labels = []
    @album_interface = AlbumInterface.new
    super
  end

  def game_from_json(file_name)
    game_data = []
    if file_exist?(file_name)
      from_json(File.read(file_name)).each do |game|
        game_author = game['author']
        author = Author.new(game_author['first_name'], game_author['last_name'])
        game = Game.new(author, game['publish_date'], game['last_played_at'], game['multiplayer'])
        game_data << game
      end
    end
    game_data
  end

  def author_from_json(file_name)
    author_data = []
    if file_exist?(file_name)
      from_json(File.read(file_name)).each do |author|
        author_data << Author.new(author['first_name'], author['last_name'])
      end
    end
    author_data
  end

  def add_book
    genre = get_valid_input('Enter book genre : ', method(:check_string?))
    author = author_data_feed
    label = create_label
    publish_date = get_valid_input('Enter publish date [YYYY-MM-DD] : ', method(:check_date?))
    publisher = get_valid_input('Enter publisher : ', method(:check_string?))
    cover_state = get_valid_input('Enter cover state : ', method(:check_string?))

    books << Book.new(genre, author, label, publish_date, publisher, cover_state)
  end

  def get_valid_input(prompt, validation_method)
    input = ''
    until validation_method.call(input)
      print prompt
      input = gets.chomp
      puts ''
      puts 'Invalid input format' unless validation_method.call(input)
    end
    input
  end

  def create_label
    title = get_valid_input('Enter label title : ', method(:check_string?))
    color = get_valid_input('Enter label color : ', method(:check_string?))
    label = Label.new(title, color)
    labels << label
    label
  end

  def add_music_album
    puts "\n"
    @album_interface.create_album
    puts "\n"
  end

  def author_data_feed
    author_first_name = ''
    until check_string?(author_first_name)
      print 'Enter author first name : '
      author_first_name = gets.chomp
      puts ''
      puts 'Invalid name format' unless check_string?(author_first_name)
    end

    author_last_name = ''
    until check_string?(author_last_name)
      print 'Enter author last name : '
      author_last_name = gets.chomp
      puts ''
      puts 'Invalid name format' unless check_string?(author_last_name)
    end
    author = Author.new(author_first_name, author_last_name)
    @authors << author
    author
  end

  def add_game
    publish_date = ''
    until check_date?(publish_date)
      print 'Enter publish date [YYYY-MM-DD] : '
      publish_date = gets.chomp
      puts ''
      puts 'Invalid date' unless check_date?(publish_date)
    end

    last_played_at = ''
    until check_date?(last_played_at) && date_compare(publish_date, last_played_at)
      print 'Enter last played date [YYYY-MM-DD] : '
      last_played_at = gets.chomp
      puts ''
      puts 'Invalid date, should be greater then publish date' unless check_date?(publish_date) && date_compare(
        publish_date, last_played_at
      )
    end
    print 'Is it mutliplayer [Y/N] : '
    multiplayer = gets.chomp == 'Y'
    puts ''
    games << Game.new(author_data_feed, publish_date, last_played_at, multiplayer)
  end

  def check_string?(string)
    string.match?(/[A-Z]/i)
  end

  def date_compare(date1, date2)
    Date.strptime(date1) < Date.strptime(date2)
  end

  def check_date?(date_string)
    date_string.match?(/^\d{4}-\d{2}-\d{2}$/)
  end

  def list_books
    books.each_with_index do |book, index|
      puts ''
      puts "Book #{index + 1}"
      puts "Genre: #{book.genre}"
      puts "Author: #{book.author.first_name} #{book.author.last_name}" if book.respond_to?(:author) && book.author
      puts "Label: #{book.label.title} (#{book.label.color})"
      puts "Publish Date: #{book.publish_date}"
      puts "Publisher: #{book.publisher}"
      puts "Cover State: #{book.cover_state}"
      puts "Archived: #{book.can_be_archived? ? 'YES' : 'NO'}"
      puts ''
    end
  end

  def list_music_albums
    puts "\n"
    @album_interface.show_music_albums
    puts "\n"
  end

  def list_games
    @games.each_with_index do |game, index|
      puts ''
      puts "game #{index + 1}"
      puts "author name : #{game.author.first_name} #{game.author.last_name}"
      puts "publish date : #{game.publish_date}"
      puts "last played at : #{game.last_played_at}"
      puts "multiplayer : #{game.multiplayer ? 'YES' : 'NO'}"
      puts ''
    end
  end

  def list_geners
    puts "\n"
    @album_interface.show_album_genres
    puts "\n"
  end

  def list_labels
    labels.each_with_index do |label, index|
      puts ''
      puts "Label #{index + 1}"
      puts "Title: #{label.title}"
      puts "Color: #{label.color}"
      puts ''
    end
  end

  def list_authors
    @authors.each_with_index do |author, _index|
      puts ''
      puts "author id : #{author.id}"
      puts "author name : #{author.first_name} #{author.last_name}"
      puts ''
    end
  end

  def save_data
    @album_interface.save_genres_and_albums_to_file
    save_author_data
    save_game_data
  end

  def load_data
    @album_interface.load_genres_and_albums_from_file
  end
end
