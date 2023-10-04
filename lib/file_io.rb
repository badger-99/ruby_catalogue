require 'json'
class FileIO
  def file_exist?(file_name)
    File.exist?(file_name) && File.size(file_name).positive?
  end
end
