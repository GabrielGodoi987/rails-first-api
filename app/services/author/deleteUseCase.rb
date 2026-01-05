class DeleteUseCase
  def initialize(author_repository:)
    @author_repository = author_repository
  end

  def execute(author_id:)
    author = @author_repository.find_by_id(author_id)

    return unless author

    @author_repository.delete(author)
  end
end
