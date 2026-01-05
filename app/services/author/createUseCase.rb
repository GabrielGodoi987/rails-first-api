class CreateUseCase
  def initialize(author_repository)
    @author_repository = author_repository
  end

  def execute(authorDto)
    doesAuthorExists = @author_repository.find_by_name(authorDto[:name])

    if doesAuthorExists
      raise "Author already exists"
    end

    author = Author.new(authorDto)
    @author_repository.save(author)

    author
  end
end
