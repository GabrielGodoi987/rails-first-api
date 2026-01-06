class UpdateUseCase
  def initialize(bookcase_repository)
    @bookcase_repository = bookcase_repository
  end

  def execute(bookcase_data)
    bookcase = @bookcase_repository.find_by_id(bookcase_data[:id])

    if bookcase.nil?
      raise "Bookcase not found"
    end

    @bookcase_repository.update(bookcase_data)
  end
end
