require_relative '../application/user_interface'

class ConsoleUserInterface < UserInterface

  def initialize(task_service)
    @task_service = task_service
  end

  def get_command
    print "Ingrese un comando ([a]gregar, [c]ompletar, [s]alir): "
    gets.chomp.downcase
  end

  def list_tasks
    tasks = @task_service.list_tasks
    display_tasks(tasks)
  end

  def create_task
    print "Ingrese la descripción de la tarea: "
    description = gets.chomp
    
    success = @task_service.create_task(description)

    if success
      display_message("Tarea agregada exitosamente.")
    else
      display_message("Error al agregar la tarea.")
    end
  end
  
  def complete_task
    print "Ingrese el ID de la tarea a completar: "
    task_id = gets.chomp.to_i
    
    success = @task_service.complete_task(task_id)
    
    if success
      display_message("Tarea completada.")
    else
      display_message("La tarea no existe.")
    end
  end

  def exit_system
    display_message("¡Hasta luego!")
  end

  def display_message(message)
    puts message
  end

  def display_tasks(tasks)
    if tasks.empty?
      puts "No hay tareas."
    else
      tasks.each do |task|
        puts task
      end
    end
  end
end