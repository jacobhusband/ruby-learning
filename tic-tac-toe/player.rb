# frozen_string_literal: true

# contains attributes and methods for the player
class Player
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def marker
    @number == 1 ? "X" : "O"
  end
end
