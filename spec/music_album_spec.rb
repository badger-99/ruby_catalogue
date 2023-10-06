require './lib/music_album'

describe MusicAlbum do
  before(:all) do
    @genre = Genre.new('R-Spec')
  end

  describe '#new' do
    it 'takes 3 strings, a Genre object, and a boolean and returns a MusicAlbum object' do
      date = '04-10-2023'
      title = 'Ruby'
      artist = 'Badger'
      genre = @genre
      on_spotify = true
      album = MusicAlbum.new(date, title, artist, genre, on_spotify)

      expect(album).to be_an_instance_of MusicAlbum
    end
  end

  describe '#can_be_archived' do
    it 'should return true if date is 10 years or older AND album is on spotify' do
      date = '03-10-2013'
      title = 'Testing'
      artist = 'Badger-99'
      genre = @genre
      on_spotify = true
      album2 = MusicAlbum.new(date, title, artist, genre, on_spotify)
      expect(album2.move_to_archive).to eql(true)
    end

    it 'should return false if date is less than 10 and album is on spotify' do
      date = '03-10-2014'
      title = 'Testing'
      artist = 'Badger-99'
      genre = @genre
      on_spotify = true
      album2 = MusicAlbum.new(date, title, artist, genre, on_spotify)
      expect(album2.move_to_archive).to eql(false)
    end

    it 'should return false if date is is 10 years or older and album is not on spotify' do
      date = '03-10-2013'
      title = 'Testing'
      artist = 'Badger-99'
      genre = @genre
      on_spotify = false
      album2 = MusicAlbum.new(date, title, artist, genre, on_spotify)
      expect(album2.move_to_archive).to eql(false)
    end

    it 'should return false if date is less than 10 and album is not on spotify' do
      date = '03-10-2013'
      title = 'Testing'
      artist = 'Badger-99'
      genre = @genre
      on_spotify = false
      album2 = MusicAlbum.new(date, title, artist, genre, on_spotify)
      expect(album2.move_to_archive).to eql(false)
    end
  end

  describe '#to_hash' do
    it 'should return a hash representation of the MusicAlbum object' do
      date = '04-10-2023'
      title = 'Ruby'
      artist = 'Badger'
      genre = @genre
      on_spotify = true
      album = MusicAlbum.new(date, title, artist, genre, on_spotify)

      album_id = album.id
      date = Date.parse('04-10-2023')

      album_hash = {
        'id' => album_id,
        'date' => date,
        'title' => 'Ruby',
        'artist' => 'Badger',
        'genre_name' => @genre.name,
        'on_spotify' => true
      }

      expect(album.to_hash).to eql(album_hash)
    end
  end
end
