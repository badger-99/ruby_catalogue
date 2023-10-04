require_relative 'genre'

class GenreInterface
  attr_reader :genre_list

  def initialize
    @genre_list = []
  end

  def create_genre(name)
    user_genre = name.empty? ? Genre.new : Genre.new(name)
    add_genre_to_list(user_genre)
  end

  def show_genres(genre_array)
    genre_array.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  private

  def add_genre_to_list(genre)
    match = @genre_list.find { |item| item.name == genre.name }
    if match.nil?
      @genre_list.push(genre)
      genre
    else
      match
    end
  end
end
