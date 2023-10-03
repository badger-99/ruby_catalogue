require_relative 'lib/app'
require 'pry'

class Main
  OPERATION_MAP = {
    1 => :add_book,
    2 => :add_music_album,
    3 => :add_game,
    4 => :list_books,
    5 => :list_music_albums,
    6 => :list_games,
    7 => :list_geners,
    8 => :list_labels,
    9 => :list_authors
  }.freeze

  attr_accessor :app

  def initialize
    @app = App.new
  end

  def start
    user_input = 0
    while user_input != 10
      puts '1) add a book'
      puts '2) add a music album'
      puts '3) add a game'
      puts '4) List all books'
      puts '5) List all music albums'
      puts '6) list of games'
      puts "7) list all genres (eg 'Comedy', 'Thriller')"
      puts "8) list all labels (eg 'Gift', 'New')"
      puts "9) List all authors (e.g. 'Stephen King')"
      puts '10) Exit'
      print 'Enter your choice : '
      user_input = gets.chomp.strip.to_i
      choise_map(user_input)
    end
  end

  def choise_map(user_input)
    if OPERATION_MAP.key?(user_input)
      @app.send(OPERATION_MAP[user_input])
    elsif user_input == 10
      puts 'Thank you for using our application!'
    else
      puts 'invalid'
    end
  end
end

main = Main.new
main.start
