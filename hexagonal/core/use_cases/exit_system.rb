class ExitSystem
  def initialize(output)
    @output = output
  end

  def call
    @output.display_message("¡Hasta luego!")
  end
end