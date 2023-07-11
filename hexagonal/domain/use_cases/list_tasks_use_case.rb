class ListTasksUseCase
  def initialize(repo, output)
    @repo = repo
    @output = output
  end

  def call
    tasks = @repo.all
    tasks = tasks.sort_by { |task| task.completed ? 1 : 0 }
    @output.display_tasks(tasks)
  end
end
