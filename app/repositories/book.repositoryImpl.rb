class BookRepositoryImpl < BaseRepository
  def find_by_id(id)
    Book.find_by(id: id)
  end

  def find_all
    Book.all
  end

  def save(entity)
    book = Book.new(entity.to_h)
    book.save
    book
  end

  def update(entity)
    book = Book.find_by(id: entity[:id])
    return nil unless book

    book.update(entity)
    book
  end

  def delete(id)
    book = Book.find_by(id: id)
    return false unless book
    book.destroy
    true
  end

  def find_one(id)
    Book.find_by(id: id)
  end

  def find_by_name(name)
    Book.find_by(title: name)
  end
end
