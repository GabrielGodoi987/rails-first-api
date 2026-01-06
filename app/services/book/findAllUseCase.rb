class FindAllUseCase
  def initialize(book_repository)
    @book_repository = book_repository
  end

  def execute
    @book_repository.find_all
  end
end
