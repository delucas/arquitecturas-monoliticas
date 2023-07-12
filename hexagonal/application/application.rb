class TodoListApplication
  def initialize(input_port, output_port, repository)
    @input_port = input_port
    @output_port = output_port
    @repository = repository
  end

  def run
    system("clear")
    @input_port.list_tasks
    puts "-"*20
    
    command = @input_port.get_command
    
    case command
    when "a"
      @input_port.create_task
    when "c"
      @input_port.complete_task
    when "s"
      @input_port.exit_system
      return false
    else
      @output_port.display_message("Comando inválido.")
    end
    return true
  end
end
