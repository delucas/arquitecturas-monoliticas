class ListTasks
  def initialize(task_repository)
    @task_repository = task_repository
  end

  def call
    tasks = @task_repository.all
    tasks = tasks.sort_by { |task| task.completed ? 1 : 0 }
    tasks
  end
end
