class TaskRepository
  def all
    raise NotImplementedError
  end

  def get(task_id)
    raise NotImplementedError
  end

  def create(attributes)
    raise NotImplementedError
  end

  def update(attributes)
    raise NotImplementedError
  end
end