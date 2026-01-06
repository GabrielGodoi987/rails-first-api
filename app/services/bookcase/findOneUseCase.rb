class FindOneUseCase
  def initialize(bookcase_repository)
    @bookcase_repository = bookcase_repository
  end

  def execute(id)
    bookcase = @bookcase_repository.find_one(id)

    if bookcase.nil?
      raise "Bookcase not found"
    end

    bookcase
  end
end
