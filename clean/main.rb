require_relative '04_application/application'

require_relative '03_external_interfaces/console_user_interface'

require_relative '02_interface_adapters/tasks_controller'
require_relative '02_interface_adapters/gateways/in_memory_task_repository'

require_relative '01_use_cases/list_tasks'
require_relative '01_use_cases/create_task'
require_relative '01_use_cases/complete_task'

# Injects dependencies
task_resository = InMemoryTaskRepository.new

list_tasks = ListTasks.new(task_resository)
create_task = CreateTask.new(task_resository)
complete_task = CompleteTask.new(task_resository)

tasks_controller = TasksController.new(list_tasks, create_task, complete_task)
console_user_interface = ConsoleUserInterface.new(tasks_controller)
application = TodoListApplication.new(console_user_interface)
# Starts the application
loop do
  continue = application.run
  break unless continue
end