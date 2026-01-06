class BookcaseRepositoryImpl < BaseRepository
  def find_by_id(id)
    Bookcase.find_by(id: id)
  end

  def find_all
    Bookcase.all
  end

  def save(entity)
    bookcase = Bookcase.new(entity.to_h)
    bookcase.save
    bookcase
  end

  def update(entity)
    bookcase = Bookcase.find_by(id: entity[:id])
    return nil unless bookcase

    bookcase.update(entity)
    bookcase
  end

  def delete(id)
    bookcase = Bookcase.find_by(id: id)
    return false unless bookcase
    bookcase.destroy
    true
  end

  def find_one(id)
    Bookcase.find_by(id: id)
  end

  def find_by_name(name)
    Bookcase.find_by(name: name)
  end
end
