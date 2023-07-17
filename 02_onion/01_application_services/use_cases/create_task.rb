require_relative '../../00_core/domain/task'

class CreateTask
  def initialize(task_repository)
    @task_repository = task_repository
  end

  def call(description)
    task = Task.new(description)
    @task_repository.create(task)
    true
  end
end
