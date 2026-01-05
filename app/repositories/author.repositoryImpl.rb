class AuthroRepositoryImpl < BaseRepository
  def find_by_id(id)
    Author.find_by(id: id)
  end

  def find_all
    Author.all
  end

  def save(entity)
    author = Author.new(entity.to_h)
    author.save
    author
  end

  def update(entity)
    author = Author.find_by(id: entity.id)
    return nil unless author

    author.update(entity.to_h)
    author
  end

  def delete(id)
    author = Author.find_by(id: id)
    return false unless author
    author.destroy
    true
  end
end
