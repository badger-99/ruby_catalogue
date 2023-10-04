require './lib/genre'
require './lib/music_album'

describe Genre do
  describe '#new' do
    it 'creates a Genre object with a default name of "Unkwown" if no argument is given' do
      genre = Genre.new
      expect(genre).to be_an_instance_of Genre
      expect(genre.name).to eql('Unknown')
    end

    it 'takes a string and creates a Genre object with the given string as the name' do
      genre = Genre.new('Test')
      expect(genre).to be_an_instance_of Genre
      expect(genre.name).to eql('Test')
    end
  end
  describe '#add_items' do
    it 'adds an instance or child of the Item class to the @items array in the Genre object' do
      test_genre = Genre.new('Test')
      date = '04-10-2023'
      title = 'Ruby'
      artist = 'Badger'
      genre = nil
      on_spotify = true
      album = MusicAlbum.new(date, title, artist, genre, on_spotify)

      expect(test_genre.items).to be_empty
      expect(album.genre).to eql(nil)

      test_genre.add_items(album)

      expect(test_genre.items).to include(album)
      expect(album.genre).to eq(test_genre)
    end

    it 'will not add the same instance or child of the Item class to the @items array more than once' do
      test_genre = Genre.new('Test')
      date = '04-10-2023'
      title = 'Ruby'
      artist = 'Badger'
      on_spotify = true
      album = MusicAlbum.new(date, title, artist, test_genre, on_spotify)

      expect(test_genre.items.length).to eql(1)

      test_genre.add_items(album)

      expect(test_genre.items.length).to eql(1)
    end
  end

  describe '#to_hash' do
    it 'should return a hash representation of the Genre object' do
      test_genre = Genre.new('Test')
      genre_id = test_genre.id
      genre_hash = {
        'id' => genre_id,
        'name' => 'Test'
      }

      expect(test_genre.to_hash).to eql(genre_hash)
    end
  end
end
