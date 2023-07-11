require_relative '../../domain/ports/input_port'

class ConsoleInput < InputPort

  def initialize(list_tasks_use_case, create_task_use_case, complete_task_use_case, exit_system_use_case)
    @list_tasks_use_case = list_tasks_use_case
    @create_task_use_case = create_task_use_case
    @complete_task_use_case = complete_task_use_case
    @exit_system_use_case = exit_system_use_case
  end

  def get_command
    print "Ingrese un comando ([a]gregar, [c]ompletar, [s]alir): "
    gets.chomp.downcase
  end

  def list_tasks
    @list_tasks_use_case.call
  end

  def create_task
    print "Ingrese la descripción de la tarea: "
    description = gets.chomp
    
    @create_task_use_case.call(description)
  end

  def complete_task
    print "Ingrese el ID de la tarea a completar: "
    task_id = gets.chomp.to_i

    @complete_task_use_case.call(task_id)
  end

  def exit_system
    @exit_system_use_case.call
  end
end