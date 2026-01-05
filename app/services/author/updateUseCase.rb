class UpdateUseCase
  def initialize(author_repository)
    @author_repository = author_repository
  end

  def execute(author_data)
    author = @author_repository.find_by_id(author_data[:id])

    if author.nil?
      raise "Author not found"
    end

    @author_repository.update(author_data)
  end
end
