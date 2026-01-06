class UpdateUseCase
  def initialize(book_repository)
    @book_repository = book_repository
  end

  def execute(book_data)
    book = @book_repository.find_by_id(book_data[:id])

    if book.nil?
      raise "Book not found"
    end

    @book_repository.update(book_data)
  end
end
