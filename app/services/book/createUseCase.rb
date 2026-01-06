class CreateUseCase
  def initialize(book_repository)
    @book_repository = book_repository
  end

  def execute(book_dto)
    book = Book.new(book_dto)
    @book_repository.save(book)

    book
  end
end
