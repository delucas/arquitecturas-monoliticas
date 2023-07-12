# Archivo: main.rb
require_relative 'infrastructure/repository/in_memory_task_repository'

require_relative 'application/use_cases/list_tasks_use_case'
require_relative 'application/use_cases/create_task_use_case'
require_relative 'application/use_cases/complete_task_use_case'
require_relative 'application/use_cases/exit_system_use_case'

require_relative 'ui/console_interface'

# Injects dependencies
task_repository = InMemoryTaskRepository.new

list_tasks_use_case = ListTasksUseCase.new(task_repository)
create_task_use_case = CreateTaskUseCase.new(task_repository)
complete_task_use_case = CompleteTaskUseCase.new(task_repository)
exit_system_use_case = ExitSystemUseCase.new

ui = ConsoleInterface.new(list_tasks_use_case, create_task_use_case, complete_task_use_case, exit_system_use_case)

# Starts the application
loop do
  continue = ui.run
  break unless continue
end