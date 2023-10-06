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
end
