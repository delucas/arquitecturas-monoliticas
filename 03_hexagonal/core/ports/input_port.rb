class InputPort
  def list_tasks
    raise NotImplementedError
  end

  def create_task
    raise NotImplementedError
  end

  def complete_task
    raise NotImplementedError
  end

  def exit_system
    raise NotImplementedError
  end
end
