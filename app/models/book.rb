class Book < ApplicationRecord
  belongs_to :author
  attr_accessor :new_author_name


  validates :title, presence: true, length: { minimum: 5 }
  validates :author, presence: true
  validates :description, presence: true
  validates :publication_year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1800, less_than_or_equal_to: Time.current.year }
end
