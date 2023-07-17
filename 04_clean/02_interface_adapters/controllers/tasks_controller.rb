require_relative '../../01_use_cases/create_task'

class TasksController
  Task = Struct.new(:id, :description, :completed)
  ListResponse = Struct.new(:size, :tasks)
  
  CreateResponse = Struct.new(:success, :errors)
  CompleteResponse = Struct.new(:success, :errors)
  ExitResponse = Struct.new(:success, :errors)

  def initialize(list_tasks, create_task, complete_task, exit_system)
    @list_tasks = list_tasks
    @create_task = create_task
    @complete_task = complete_task
    @exit_system = exit_system
  end

  def list_tasks
    response = @list_tasks.call
    tasks = response.tasks.map do |task|
      Task.new(task.id, task.description, task.completed)
    end
    ListResponse.new(tasks.size, tasks)
  end

  def create_task(params)
    response = @create_task.call(CreateTask::Request.new(params[:description]))
    CreateResponse.new(response.success?, response.errors)
  end

  def complete_task(params)
    response = @complete_task.call(params)
    CompleteResponse.new(response.success?, response.errors)
  end

  def exit_system
    response = @exit_system.call
    ExitResponse.new(response.success?, [])
  end
end