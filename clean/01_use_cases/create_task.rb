class CreateTask
  Request = Struct.new(:description)
  Response = Struct.new(:success?, :errors)

  def initialize(task_repository)
    @task_repository = task_repository
  end

  def call(request)
    @task_repository.create(request.to_h)
    Response.new(true, [])
  end
end
