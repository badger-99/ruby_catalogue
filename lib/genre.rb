class Genre
  attr_reader :name, :items

  def initialize(name = 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_items(item)
    @items.push(item) unless @items.include?(item)
    item.add_genre(self)
  end
end

class GenreManager
  attr_reader :genre_list

  def initialize
    @genre_list = []
  end

  def create_genre
    puts 'Enter the genre (press ENTER if you don\'t know it): '
    name = gets.chomp.capitalize
    name.empty? ? Genre.new : Genre.new(name)
  end

  def add_genre(genre)
    return unless genre.instance_of?(Genre)

    match = @genre_list.select { |item| item.name == genre.name }
    @genre_list.push(genre) if match.empty?
  end

  def show_genres(genre_array)
    genre_array.each_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end
end
