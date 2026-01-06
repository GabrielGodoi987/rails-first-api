class CreateUseCase
  def initialize(author_repository)
    @author_repository = author_repository
  end

  def execute(author_dto)
    does_author_exist = @author_repository.find_by_name(author_dto[:name])

    if does_author_exist
      raise "Author already exists"
    end

    author = Author.new(author_dto)
    @author_repository.save(author)

    author
  end
end
