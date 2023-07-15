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

  def to_s
    status = completed ? "[X]" : "[ ]"
    "#{status} #{id}: #{description}"
  end
end
