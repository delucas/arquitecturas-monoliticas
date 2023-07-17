class TaskService
  def list_tasks
    raise NotImplementedError
  end

  def create_task(description)
    raise NotImplementedError
  end

  def complete_task(task_id)
    raise NotImplementedError
  end
end