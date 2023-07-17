require_relative '../../core/ports/output_port'

class ConsoleOutput < OutputPort
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