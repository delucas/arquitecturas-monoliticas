class Task
  attr_accessor :id, :description, :completed

  def initialize(description)
    @id = nil
    @description = description
    @completed = false
  end

  def complete
    @completed = true
  end
end
