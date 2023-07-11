class CompleteTaskUseCase
  def initialize(repo, output)
    @repo = repo
    @output = output
  end

  def call(task_id)
    task = @repo.get(task_id)
    if task.nil?
      @output.display_message("La tarea no existe.")
    else
      task.complete
      @repo.update(task)
      @output.display_message("Tarea completada.")
    end
  end
end
