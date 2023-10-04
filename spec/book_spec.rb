require_relative '../lib/book'
require_relative '../lib/author'
require_relative '../lib/label'
require_relative '../lib/genre'

RSpec.describe Book do
  let(:genre) { Genre.new('Fiction') }
  let(:author) { Author.new('John', 'Doe') }
  let(:label) { Label.new('Bestseller', 'Red') }
  let(:date) { '2023-01-01' }
  let(:publisher) { 'Example Publisher' }
  let(:cover_state) { 'Good' }

  describe '#initialize' do
    it 'should initialize a Book object with given parameters' do
      book = Book.new(genre, author, label, date, publisher, cover_state)

      expect(book.publisher).to eq(publisher)
      expect(book.cover_state).to eq(cover_state)
      expect(book.publish_date).to eq(Date.parse(date))
      expect(book.label).to eq(label)
      expect(book.genre).to eq(genre)
      expect(book.author).to eq(author)
      expect(book.can_be_archived?).to be_truthy
    end
  end

  describe '#can_be_archived?' do
    it 'should return true if the cover state is bad' do
      book = Book.new(genre, author, label, date, publisher, 'bad')
      expect(book.can_be_archived?).to be_truthy
    end

    it 'should return false if the cover state is not bad and the base method returns false' do
      allow(book).to receive(:super).and_return(false)
      expect(book.can_be_archived?).to be_falsey
    end

    it 'should return true if the cover state is not bad and the base method returns true' do
      allow(book).to receive(:super).and_return(true)
      expect(book.can_be_archived?).to be_truthy
    end
  end
end