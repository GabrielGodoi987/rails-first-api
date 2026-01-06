class DeleteUseCase
  def initialize(bookcase_repository:)
    @bookcase_repository = bookcase_repository
  end

  def execute(bookcase_id:)
    bookcase = @bookcase_repository.find_by_id(bookcase_id)

    return unless bookcase

    @bookcase_repository.delete(bookcase)
  end
end
