require_relative '../01_user_interface/task_service'
require_relative '../A0_domain/task'

class DefaultTaskService < TaskService
  def initialize(task_repository)
    @task_repository = task_repository
  end

  def list_tasks
    tasks = @task_repository.all
    tasks = tasks.sort_by { |task| task.completed ? 1 : 0 }
    tasks
  end

  def create_task(description)
    task = Task.new(description)
    @task_repository.create(task)
    true
  end

  def complete_task(task_id)
    task = @task_repository.get(task_id)
    return false if task.nil?
      
    task.complete
    @task_repository.update(task)
    true
  end
end