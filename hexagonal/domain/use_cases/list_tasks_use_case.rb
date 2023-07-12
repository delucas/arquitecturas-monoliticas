class ListTasksUseCase
  def initialize(task_repository, output)
    @task_repository = task_repository
    @output = output
  end

  def call
    tasks = @task_repository.all
    tasks = tasks.sort_by { |task| task.completed ? 1 : 0 }
    @output.display_tasks(tasks)
  end
end
