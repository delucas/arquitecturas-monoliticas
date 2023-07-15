class ListTasks
  Task = Struct.new(:id, :description, :completed)
  Response = Struct.new(:tasks)

  def initialize(task_repository)
    @task_repository = task_repository
  end

  def call
    tasks = @task_repository.all
    tasks = tasks.sort_by { |task| task.completed ? 1 : 0 }
    tasks_response = tasks.map do |task|
      Task.new(task.id, task.description, task.completed)
    end
    Response.new(tasks_response)
  end
end
