class CompleteTask
  def initialize(task_repository)
    @task_repository = task_repository
  end

  def call(task_id)
    task = @task_repository.get(task_id)
    return false if task.nil?
      
    task.complete
    @task_repository.update(task)
    true
  end
end
