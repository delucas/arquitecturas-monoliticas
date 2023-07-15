require_relative 'domain/model/task'
require_relative 'domain/ports/input_port'
require_relative 'domain/ports/output_port'

require_relative 'infrastructure/adapters/console_input'
require_relative 'infrastructure/adapters/console_output'
require_relative 'infrastructure/repositories/in_memory_task_repository'

require_relative 'domain/use_cases/list_tasks_use_case'
require_relative 'domain/use_cases/create_task_use_case'
require_relative 'domain/use_cases/complete_task_use_case'
require_relative 'domain/use_cases/exit_system_use_case'

require_relative 'application/application'

# Injects dependencies
task_repository = InMemoryTaskRepository.new
output_port = ConsoleOutput.new

list_tasks_use_case = ListTasksUseCase.new(task_repository, output_port)
create_task_use_case = CreateTaskUseCase.new(task_repository, output_port)
complete_task_use_case = CompleteTaskUseCase.new(task_repository, output_port)
exit_system_use_case = ExitSystemUseCase.new(output_port)

input_port = ConsoleInput.new(list_tasks_use_case, create_task_use_case, complete_task_use_case, exit_system_use_case)

application = TodoListApplication.new(input_port, output_port, task_repository)

# Starts the application
loop do
  continue = application.run
  break unless continue
end