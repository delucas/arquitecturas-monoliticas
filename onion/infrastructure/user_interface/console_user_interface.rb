class ConsoleUserInterface
  def initialize(list_tasks, create_task, complete_task, exit_system)
    @complete_task = complete_task
    @create_task = create_task
    @list_tasks = list_tasks
    @exit_system = exit_system
  end

  def run
    system("clear")
    tasks = @list_tasks.call
    display_tasks(tasks)
    puts "-"*20
    
    command = get_command
    
    case command
    when "a"
      create_task
    when "c"
      complete_task
    when "s"
      exit_system
      return false
    else
      display_message("Comando inválido.")
    end
    return true
  end

private

  def get_command
    print "Ingrese un comando ([a]gregar, [c]ompletar, [s]alir): "
    gets.chomp.downcase
  end

  def list_tasks
    @list_tasks.call
  end

  def create_task
    print "Ingrese la descripción de la tarea: "
    description = gets.chomp
    
    success = @create_task.call(description)

    if success
      display_message("Tarea agregada exitosamente.")
    else
      display_message("Error al agregar la tarea.")
    end
  end
  
  def complete_task
    print "Ingrese el ID de la tarea a completar: "
    task_id = gets.chomp.to_i
    
    success = @complete_task.call(task_id)
    
    if success
      display_message("Tarea completada.")
    else
      display_message("La tarea no existe.")
    end
  end

  def exit_system
    @exit_system.call
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
