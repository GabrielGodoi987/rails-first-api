class DeleteUseCase
  def initialize(book_repository:)
    @book_repository = book_repository
  end

  def execute(book_id:)
    book = @book_repository.find_by_id(book_id)

    return unless book

    @book_repository.delete(book)
  end
end
