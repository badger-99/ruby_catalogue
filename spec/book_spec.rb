require_relative '../lib/book'
require_relative '../lib/author'
require_relative '../lib/label'
require_relative '../lib/genre'

RSpec.describe Book do
  let(:genre) { Genre.new('Fiction') }
  let(:author) { Author.new('John', 'Doe') }
  let(:label) { Label.new('Bestseller', 'Red') }
  let(:date) { '2001-01-01' }
  let(:publisher) { 'Example Publisher' }
  let(:cover_state_good) { 'Good' }
  let(:cover_state_bad) { 'bad' }

  describe '#can_be_archived?' do
    it 'should return true if the cover state is bad' do
      book = Book.new(genre, author, label, date, publisher, 'bad')
      expect(book.send(:can_be_archived?)).to be_truthy
    end

    it 'should return true if the base method returns true' do
      allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(true)
      book = Book.new(genre, author, label, date, publisher, cover_state_good)
      expect(book.send(:can_be_archived?)).to be_truthy
    end

    it 'should return false if both conditions are false' do
      allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(false)
      book = Book.new(genre, author, label, date, publisher, cover_state_good)
      expect(book.send(:can_be_archived?)).to be_falsey
    end
  end
end
