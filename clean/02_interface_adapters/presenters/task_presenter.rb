class TaskPresenter
  def initialize(task)
    @task = task
  end

  def to_s
    status = @task.completed ? "[X]" : "[ ]"
    "#{status} #{@task.id}: #{@task.description}"
  end
end