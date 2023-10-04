require_relative '../lib/book'

RSpec.describe Book do
    describe '#initialize' do
    it 'creates a new book with given inputs' do
        genre = 'genre'
        author = 'author'
        label = 'label'
        date = '2023-02-01'
        publisher = 'publisher'
        cover_state = 'good'

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
end