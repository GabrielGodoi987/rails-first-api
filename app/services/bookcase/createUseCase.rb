class CreateUseCase
  def initialize(bookcase_repository)
    @bookcase_repository = bookcase_repository
  end

  def execute(bookcase_dto)
    bookcase = Bookcase.new(bookcase_dto)
    @bookcase_repository.save(bookcase)

    bookcase
  end
end
