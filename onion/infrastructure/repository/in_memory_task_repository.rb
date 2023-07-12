require_relative 'task_repository'

class InMemoryTaskRepository < TaskRepository
  def initialize
    @tasks = []
    @next_id = 1
  end

  def create(task)
    task.id = @next_id
    @tasks << task
    @next_id += 1
  end

  def all
    @tasks
  end

  def get(task_id)
    @tasks.find { |task| task.id == task_id }
  end

  def update(task)
    # Nothing to do here, since the task is already in memory
  end
end