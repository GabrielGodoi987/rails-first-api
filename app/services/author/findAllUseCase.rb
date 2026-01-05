class FindAllUseCase
  def initialize(author_repository)
    @author_repository = author_repository
  end

  def execute
    return @author_repository.find_all
  end
end
