class FindOneUseCase
  def initialize(book_repository)
    @book_repository = book_repository
  end

  def execute(id)
    book = @book_repository.find_one(id)

    if book.nil?
      raise "Book not found"
    end

    book
  end
end
