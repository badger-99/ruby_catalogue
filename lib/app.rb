require 'date'
require_relative 'author'
require_relative 'game'

class App
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def add_book
    # ** add book logic
  end

  def add_music_album
    # ** add music album logic
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
      print 'Enter publish date [YYYY-MM-DD] :'
      publish_date = gets.chomp
      puts ''
      puts 'Invalid date' unless check_date?(publish_date)
    end

    last_played_at = ''
    until check_date?(last_played_at) && date_compare(publish_date, last_played_at)
      print 'Enter last played date [YYYY-MM-DD] :'
      last_played_at = gets.chomp
      puts ''
      puts 'Invalid date, should be greater then publish date' unless check_date?(publish_date) && date_compare(
        publish_date, last_played_at
      )
    end
    print 'Is it mutliplayer [Y/N] :'
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
    date_string.match(/^\d{4}-\d{2}-\d{2}$/)
  end

  def list_books
    # TODO: list books
  end

  def list_music_albums
    # TODO: list music albums
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
    # TODO: list geners
  end

  def list_labels
    # TODO: list labels
  end

  def list_authors
    @authors.each_with_index do |author, _index|
      puts ''
      puts "author id : #{author.id}"
      puts "first name : #{author.name}"
      puts "last name : #{author.last_name}"
      puts ''
    end
  end
end
