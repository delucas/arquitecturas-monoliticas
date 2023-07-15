class CompleteTask
  Request = Struct.new(:task_id)
  Response = Struct.new(:success?, :errors)

  def initialize(task_repository)
    @task_repository = task_repository
  end

  def call(request)
    task = @task_repository.get(request[:task_id])
    if task.nil?
      return Response.new(false, ["La tarea no existe."])
    end
      
    task.complete
    @task_repository.update(task.id, task)
    Response.new(true, [])
  end
end
