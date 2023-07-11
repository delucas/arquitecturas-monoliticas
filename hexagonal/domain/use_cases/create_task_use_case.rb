class CreateTaskUseCase
  def initialize(repo, output)
    @repo = repo
    @output = output
  end

  def call(description)
    task = Task.new(description)
    @repo.create(task)
    @output.display_message("Tarea agregada exitosamente.")
  end
end
