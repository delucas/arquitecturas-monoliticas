class CompleteTask
  def initialize(task_repository, output)
    @task_repository = task_repository
    @output = output
  end

  def call(task_id)
    task = @task_repository.get(task_id)
    if task.nil?
      @output.display_message("La tarea no existe.")
    else
      task.complete
      @task_repository.update(task)
      @output.display_message("Tarea completada.")
    end
  end
end
