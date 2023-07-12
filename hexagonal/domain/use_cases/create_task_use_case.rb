class CreateTaskUseCase
  def initialize(task_repository, output)
    @task_repository = task_repository
    @output = output
  end

  def call(description)
    task = Task.new(description)
    @task_repository.create(task)
    @output.display_message("Tarea agregada exitosamente.")
  end
end
