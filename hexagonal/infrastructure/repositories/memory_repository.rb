require_relative '../../domain/ports/task_repository_port'

class MemoryRepository < TaskRepositoryPort
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
    # no hace falta hacer nada porque el objeto ya está en memoria
  end
end