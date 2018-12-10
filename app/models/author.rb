class Author < ApplicationRecord
  BESTSELLER_DEFINITION = 100

  has_many :images, dependent: :destroy
  has_many :books, dependent: :destroy

  def bestseller?
    books.sum(&:sold) > BESTSELLER_DEFINITION
  end
end
