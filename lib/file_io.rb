require 'json'
class FileIO
  def file_exist?(file_name)
    File.exist?(file_name) && File.size(file_name).positive?
  end

  def from_json(file)
    JSON.parse(file)
  end

  def to_json(data)
    data.to_json
  end

  def save_author_data
    author_data = []
    File.open('author.json', 'w') do |file|
      @authors.each do |author|
        author_data << author.to_hash
      end
      file.write(author_data.to_json)
    end
  end

  def save_game_data
    game_data = []
    File.open('game.json', 'w') do |file|
      @games.each do |game|
        game_data << game.to_hash
      end
      file.write(game_data.to_json)
    end
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
end
