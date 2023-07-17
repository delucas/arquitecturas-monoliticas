class TaskRepository
  def all
    raise NotImplementedError
  end

  def get(task_id)
    raise NotImplementedError
  end

  def create(task)
    raise NotImplementedError
  end

  def update(task)
    raise NotImplementedError
  end
end