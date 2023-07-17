class ExitSystem
  Response = Struct.new(:success?)

  def call
    Response.new(true)
  end
end
