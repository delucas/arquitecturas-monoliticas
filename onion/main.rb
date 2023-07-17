require_relative 'infrastructure/repository/in_memory_task_repository'
require_relative 'infrastructure/user_interface/console_user_interface'

require_relative 'application/use_cases/list_tasks'
require_relative 'application/use_cases/create_task'
require_relative 'application/use_cases/complete_task'
require_relative 'application/use_cases/exit_system'

# Injects dependencies
task_repository = InMemoryTaskRepository.new

list_tasks = ListTasks.new(task_repository)
create_task = CreateTask.new(task_repository)
complete_task = CompleteTask.new(task_repository)
exit_system = ExitSystem.new

ui = ConsoleUserInterface.new(list_tasks, create_task, complete_task, exit_system)

# Starts the application
loop do
  continue = ui.run
  break unless continue
end