class ConsoleInterface
  def initialize(list_tasks_use_case, create_task_use_case, complete_task_use_case, exit_system_use_case)
    @complete_task_use_case = complete_task_use_case
    @create_task_use_case = create_task_use_case
    @list_tasks_use_case = list_tasks_use_case
    @exit_system_use_case = exit_system_use_case
  end

  def run
    system("clear")
    tasks = @list_tasks_use_case.call
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
    @list_tasks_use_case.call
  end

  def create_task
    print "Ingrese la descripción de la tarea: "
    description = gets.chomp
    
    success = @create_task_use_case.call(description)

    if success
      display_message("Tarea agregada exitosamente.")
    else
      display_message("Error al agregar la tarea.")
    end
  end
  
  def complete_task
    print "Ingrese el ID de la tarea a completar: "
    task_id = gets.chomp.to_i
    
    success = @complete_task_use_case.call(task_id)
    
    if success
      display_message("Tarea completada.")
    else
      display_message("La tarea no existe.")
    end
  end

  def exit_system
    @exit_system_use_case.call
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
