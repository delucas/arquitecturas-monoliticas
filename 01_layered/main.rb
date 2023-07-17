require_relative '03_repository/in_memory_task_repository'
require_relative '02_services/default_task_service'
require_relative '01_user_interface/console_user_interface'
require_relative '00_application/application'

# Injects dependencies
task_repository = InMemoryTaskRepository.new
task_service = DefaultTaskService.new(task_repository)
user_interface = ConsoleUserInterface.new(task_service)

application = TodoListApplication.new(user_interface)

# Starts the application
loop do
  continue = application.run
  break unless continue
end