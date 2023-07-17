require_relative '../02_interface_adapters/presenters/task_presenter'

class ConsoleUserInterface
  def initialize(tasks_controller)
    @tasks_controller = tasks_controller
  end

  def get_command
    print "Ingrese un comando ([a]gregar, [c]ompletar, [s]alir): "
    gets.chomp.downcase
  end

  def list_tasks
    response = @tasks_controller.list_tasks
    if response.size == 0
      puts "No hay tareas."
    else
      response.tasks.each do |task|
        puts TaskPresenter.new(task)
      end
    end
  end

  def create_task
    print "Ingrese la descripción de la tarea: "
    description = gets.chomp
    
    response = @tasks_controller.create_task({description: description})

    if response.success
      display_message("Tarea agregada exitosamente.")
    else
      display_errors(response.errors)
    end
  end
  
  def complete_task
    print "Ingrese el ID de la tarea a completar: "
    task_id = gets.chomp.to_i
    
    response = @tasks_controller.complete_task({task_id: task_id})
    
    if response.success
      display_message("Tarea completada.")
    else
      display_errors(response.errors)
    end
  end

  def exit_system
    display_message("¡Hasta luego!")
  end

  def display_message(message)
    puts message
  end

  def display_errors(errors)
    errors.each do |error|
      puts error
    end
  end
end
