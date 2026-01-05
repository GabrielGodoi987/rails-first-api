class BaseRepository
  def find_by_id(id)
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  def find_all
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  def save(entity)
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  def update(entity)
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  def delete(id)
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end
end
