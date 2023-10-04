require 'json'
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

  def save_genres_to_file
    genre_data = @genre_list.map(&:to_hash)
    File.open('genres.json', 'w') do |file|
      file.puts JSON.generate(genre_data)
    end
  end

  def load_genres_from_file
    return if File.size?('genres.json').nil?

    JSON.parse(File.read('genres.json')).each do |genre_hash|
      id = genre_hash['id']
      name = genre_hash['name']
      genre = Genre.new(name)
      genre.id = id
      add_genre_to_list(genre)
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
