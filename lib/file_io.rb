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
end
