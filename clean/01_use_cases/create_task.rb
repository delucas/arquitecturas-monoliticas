require_relative '../00_entities/task'

class CreateTask
  Request = Struct.new(:description)
  Response = Struct.new(:success?, :errors)

  def initialize(task_repository)
    @task_repository = task_repository
  end

  def call(request)
    task = Task.new(request.description)
    @task_repository.create(task)
    Response.new(true, [])
  end
end
