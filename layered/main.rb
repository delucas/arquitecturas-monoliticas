# Archivo: main.rb

require_relative 'repository/in_memory_task_repository'
require_relative 'services/default_task_service'
require_relative 'user_interface/console_user_interface'
require_relative 'application/application'

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