class FindAllUseCase
  def initialize(bookcase_repository)
    @bookcase_repository = bookcase_repository
  end

  def execute
    @bookcase_repository.find_all
  end
end
