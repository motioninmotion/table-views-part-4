class Todo
  def self.all
    [
      Todo.new("Do the dishes", "Need dish washing liquid", :yesterday),
      Todo.new("Hang out the washing", "Get some softener", :today),
      Todo.new("Learn about Table Views", "Sign up for MotionInMotion", :tomorrow)
    ]
  end

  def self.count
    self.all.count
  end

  attr_accessor :text, :notes, :due

  def initialize(text, notes, due)
    @text, @notes, @due = text, notes, due
  end
end
