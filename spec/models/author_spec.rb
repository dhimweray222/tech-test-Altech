require 'rails_helper'

RSpec.describe Author, type: :model do
  it "has many books" do
    author = Author.reflect_on_association(:books)
    expect(author.macro).to eq(:has_many)
  end
end
