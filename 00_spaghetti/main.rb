require_relative 'domain/task'

def get_command
  print "Ingrese un comando ([a]gregar, [c]ompletar, [s]alir): "
  gets.chomp.downcase
end

def create_task
  print "Ingrese la descripción de la tarea: "
  description = gets.chomp
  
  task = Task.new(description)
  task.id = $next_id
  $tasks << task
  $next_id += 1

  display_message("Tarea agregada exitosamente.")
end

def complete_task
  print "Ingrese el ID de la tarea a completar: "
  task_id = gets.chomp.to_i

  task = $tasks.find { |task| task.id == task_id }
  display_message("La tarea no existe.") if task.nil?
    
  task.complete
  # No need to update memory, since the task is already in memory

  display_message("Tarea completada.")
end

def exit_system
  display_message("¡Hasta luego!")
end

def display_message(message)
  puts message
end

def display_tasks
  tasks = $tasks.sort_by { |task| task.completed ? 1 : 0 }

  if tasks.empty?
    puts "No hay tareas."
  else
    tasks.each do |task|
      puts task
    end
  end
end

# Starts the application
$tasks = []
$next_id = 1

loop do
  system("clear")
  display_tasks
  puts "-"*20
  
  command = get_command
    
  case command
  when "a"
    create_task
  when "c"
    complete_task
  when "s"
    exit_system
    break
  else
    display_message("Comando inválido.")
  end
end
