class Book < ApplicationRecord
  belongs_to :bookcase
  belongs_to :author

  validates :is_limit_reached

  def is_limit_reached
      if self.bookcase.books.count >= self.bookcase.limit
        errors.add(:bookcase, "has reached its limit of books")
      end
  end
end
