class FindOneUseCase
  def initialize(author_repository)
    @author_repository = author_repository
  end

  def execute(id)
    doesUserExists = @author_repository.find_one(id)

    if doesUserExists.nil?
      raise "Author not found"
    end

    return doesUserExists
  end
end