require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { described_class.new }

  it 'is valid with valid attributes' do
    book.title = 'Sample Book Title'
    book.description = 'Sample description.'
    book.publication_year = 2020
    book.author = Author.create(name: 'Sample Author')
    expect(book).to be_valid
  end

  it 'is not valid without a title' do
    expect(book).not_to be_valid
    expect(book.errors[:title]).to include("can't be blank")
  end

  it 'is not valid without an author' do
    expect(book).not_to be_valid
    expect(book.errors[:author]).to include("can't be blank")
  end

  describe 'associations' do
    it 'belongs to an author' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
