class TodoListApplication
  def initialize(user_interface)
    @user_interface = user_interface
  end

  def run
    system("clear")
    @user_interface.list_tasks
    puts "-"*20
    
    command = @user_interface.get_command
    
    case command
    when "a"
      @user_interface.create_task
    when "c"
      @user_interface.complete_task
    when "s"
      @user_interface.exit_system
      return false
    else
      @user_interface.display_message("Comando inválido.")
    end
    return true
  end
end
