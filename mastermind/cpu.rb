class CPU
  attr_accessor :code

  def initialize(colors)
    @colors = colors
    @code = new_code
  end

  def new_code
    [@colors[rand(6)],
     @colors[rand(6)],
     @colors[rand(6)],
     @colors[rand(6)]]
  end

  def code?
    @code == true
  end
end
