class TaskRepositoryPort
  def create(task)
    raise NotImplementedError
  end

  def all
    raise NotImplementedError
  end

  def get(task_id)
    raise NotImplementedError
  end

  def update(task)
    raise NotImplementedError
  end
end